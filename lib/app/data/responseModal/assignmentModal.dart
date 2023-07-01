// To parse this JSON data, do
//
//     final assignmentModal = assignmentModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AssignmentModal assignmentModalFromJson(String str) => AssignmentModal.fromJson(json.decode(str));

String assignmentModalToJson(AssignmentModal data) => json.encode(data.toJson());

class AssignmentModal {
  bool status;
  String message;
  List<DataunOfAssignment> data;

  AssignmentModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AssignmentModal.fromJson(Map<String, dynamic> json) => AssignmentModal(
    status: json["status"],
    message: json["message"],
    data: List<DataunOfAssignment>.from(json["data"].map((x) => DataunOfAssignment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataunOfAssignment {
  String id;
  String adminId;
  String teacherId;
  DateTime date;
  String subjectId;
  String batchId;
  String description;
  DateTime addedAt;
  String subjectName;

  DataunOfAssignment({
    required this.id,
    required this.adminId,
    required this.teacherId,
    required this.date,
    required this.subjectId,
    required this.batchId,
    required this.description,
    required this.addedAt,
    required this.subjectName,
  });

  factory DataunOfAssignment.fromJson(Map<String, dynamic> json) => DataunOfAssignment(
    id: json["id"],
    adminId: json["admin_id"],
    teacherId: json["teacher_id"],
    date: DateTime.parse(json["date"]),
    subjectId: json["subject_id"],
    batchId: json["batch_id"],
    description: json["description"],
    addedAt: DateTime.parse(json["added_at"]),
    subjectName: json["subject_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "teacher_id": teacherId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "subject_id": subjectId,
    "batch_id": batchId,
    "description": description,
    "added_at": addedAt.toIso8601String(),
    "subject_name": subjectName,
  };
}
