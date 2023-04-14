// To parse this JSON data, do
//
//     final signUpResponseModal = signUpResponseModalFromJson(jsonString);

import 'dart:convert';

SignUpResponseModal signUpResponseModalFromJson(String str) => SignUpResponseModal.fromJson(json.decode(str));

String signUpResponseModalToJson(SignUpResponseModal data) => json.encode(data.toJson());

class SignUpResponseModal {
  SignUpResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory SignUpResponseModal.fromJson(Map<String, dynamic> json) => SignUpResponseModal(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.adminId,
    required this.loginStatus,
    required this.name,
    required this.email,
    required this.batchId,
    required this.addedBy,
    required this.status,
    required this.enrollmentId,
    required this.password,
    required this.admissionDate,
    required this.image,
    required this.contactNo,
    required this.lastLoginApp,
    required this.appVersion,
    required this.token,
  });

  String adminId;
  String loginStatus;
  String name;
  String email;
  String batchId;
  String addedBy;
  String status;
  String enrollmentId;
  String password;
  DateTime admissionDate;
  String image;
  String contactNo;
  DateTime lastLoginApp;
  String appVersion;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    adminId: json["admin_id"],
    loginStatus: json["login_status"],
    name: json["name"],
    email: json["email"],
    batchId: json["batch_id"],
    addedBy: json["added_by"],
    status: json["status"],
    enrollmentId: json["enrollment_id"],
    password: json["password"],
    admissionDate: DateTime.parse(json["admission_date"]),
    image: json["image"],
    contactNo: json["contact_no"],
    lastLoginApp: DateTime.parse(json["last_login_app"]),
    appVersion: json["app_version"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "admin_id": adminId,
    "login_status": loginStatus,
    "name": name,
    "email": email,
    "batch_id": batchId,
    "added_by": addedBy,
    "status": status,
    "enrollment_id": enrollmentId,
    "password": password,
    "admission_date": "${admissionDate.year.toString().padLeft(4, '0')}-${admissionDate.month.toString().padLeft(2, '0')}-${admissionDate.day.toString().padLeft(2, '0')}",
    "image": image,
    "contact_no": contactNo,
    "last_login_app": lastLoginApp.toIso8601String(),
    "app_version": appVersion,
    "token": token,
  };
}
