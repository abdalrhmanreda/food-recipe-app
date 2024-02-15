import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? name;
  String? email;
  String? profileImage;
  String? address;

  UserModel({
    this.name,
    this.email,
    this.profileImage,
    this.address,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['fullName'];
    email = json['email'];
    profileImage = json['profileImage'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = name;
    data['email'] = email;
    data['profileImage'] = profileImage;
    data['address'] = address;

    return data;
  }

  @override
  List<Object> get props => [name!, email!, profileImage!, address!];
}
