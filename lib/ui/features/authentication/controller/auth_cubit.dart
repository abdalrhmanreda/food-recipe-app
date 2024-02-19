import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/cache/hive_cache.dart';
import '../../../../core/constant/strings.dart';
import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      getUserData(userId: HiveCache.getData(key: 'userId'));
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  //
  void logout() {
    emit(LoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      emit(LogoutSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void userRegister() {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text)
        .then((value) {
      createUser(
        email: emailController.text.trim(),
        name: nameController.text.trim(),
        uId: value.user!.uid,
        phone: phoneController.text.trim(),
      );
      HiveCache.saveData(key: 'userId', value: value.user!.uid);
      userId = value.user!.uid;
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void createUser({
    required String email,
    required String name,
    required String uId,
    required String phone,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      profileImage:
          'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png',
      address: 'Assuit , Egypt',
      phone: phone,
    );
    emit(LoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson())
        .then((value) {
      getUserData(userId: uId);
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  UserModel? userModel;
  void getUserData({required String userId}) {
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);

      print(userModel!.email);

      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  File? profilePhoto;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePhoto = File(pickedFile.path);
      emit(PickProfileImageSuccessState());
    } else {
      print('No Image Selected');
      emit(FailureState(error: 'error'));
    }
  }

  void uploadImage({
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    emit(LoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profilePhoto!.path).pathSegments.last}')
        .putFile(profilePhoto!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateUserData(
            name: name,
            profileImage: value,
            address: address,
            phone: phone,
            email: email);
        emit(UploadProfileImageSuccessState());
      });
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void updateUserData({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      address: address,
      profileImage: profileImage ?? userModel!.profileImage,
    );
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(model.toJson())
        .then((value) {
      getUserData(userId: userId!);
      emit(UpdateUserDataSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void updateProfileImage({
    String? uId,
  }) {
    emit(LoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profilePhoto!.path).pathSegments.last}')
        .putFile(profilePhoto!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateUserData(profileImage: value);
        profilePhoto = null;
        emit(UploadProfileImageSuccessState());
      });
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }
}
