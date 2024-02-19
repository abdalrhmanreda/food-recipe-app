import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? name;
  String? email;
  String? profileImage;
  String? address;
  String? phone;

  UserModel({
    this.name,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['fullName'];
    email = json['email'];
    profileImage = json['profileImage'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = name;
    data['email'] = email;
    data['profileImage'] = profileImage;
    data['address'] = address;
    data['phone'] = phone;

    return data;
  }

  @override
  List<Object> get props => [name!, email!, profileImage!, address!, phone!];
}
