// To parse this JSON data, do
//
//     final loginResponseModal = loginResponseModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponseModal loginResponseModalFromJson(String str) => LoginResponseModal.fromJson(json.decode(str));

String loginResponseModalToJson(LoginResponseModal data) => json.encode(data.toJson());

class LoginResponseModal {
  bool status;
  String message;
  String token;
  Data data;

  LoginResponseModal({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) => LoginResponseModal(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "data": data.toJson(),
  };
}

class Data {
  String uid;
  String name;
  String role;
  String mobile;
  String adminId;
  String profileImg;
  String email;
  String batchId;
  String enrollmentId;
  String brewersCheck;

  Data({
    required this.uid,
    required this.name,
    required this.role,
    required this.mobile,
    required this.adminId,
    required this.profileImg,
    required this.email,
    required this.batchId,
    required this.enrollmentId,
    required this.brewersCheck,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    uid: json["uid"],
    name: json["name"],
    role: json["role"],
    mobile: json["mobile"],
    adminId: json["admin_id"],
    profileImg: json["profile_img"],
    email: json["email"],
    batchId: json["batch_id"],
    enrollmentId: json["enrollment_id"],
    brewersCheck: json["brewers_check"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "role": role,
    "mobile": mobile,
    "admin_id": adminId,
    "profile_img": profileImg,
    "email": email,
    "batch_id": batchId,
    "enrollment_id": enrollmentId,
    "brewers_check": brewersCheck,
  };
}
