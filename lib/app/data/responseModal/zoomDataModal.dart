// To parse this JSON data, do
//
//     final zoomDataModalClass = zoomDataModalClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ZoomDataModalClass zoomDataModalClassFromJson(String str) => ZoomDataModalClass.fromJson(json.decode(str));

String zoomDataModalClassToJson(ZoomDataModalClass data) => json.encode(data.toJson());

class ZoomDataModalClass {
  bool status;
  String message;
  List<Datum> data;

  ZoomDataModalClass({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ZoomDataModalClass.fromJson(Map<String, dynamic> json) => ZoomDataModalClass(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String batch;
  String zoomApiKey;
  String zoomApiSecret;
  String meetingNumber;
  String password;
  String status;
  String adminId;
  DateTime addedAt;
  String uid;
  String batchId;
  String subjectId;
  String chapterId;
  String startTime;
  String endTime;
  DateTime date;
  DateTime entryDateTime;
  String subjectName;
  String chapterName;

  Datum({
    required this.id,
    required this.batch,
    required this.zoomApiKey,
    required this.zoomApiSecret,
    required this.meetingNumber,
    required this.password,
    required this.status,
    required this.adminId,
    required this.addedAt,
    required this.uid,
    required this.batchId,
    required this.subjectId,
    required this.chapterId,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.entryDateTime,
    required this.subjectName,
    required this.chapterName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    batch: json["batch"],
    zoomApiKey: json["zoom_api_key"],
    zoomApiSecret: json["zoom_api_secret"],
    meetingNumber: json["meeting_number"],
    password: json["password"],
    status: json["status"],
    adminId: json["admin_id"],
    addedAt: DateTime.parse(json["added_at"]),
    uid: json["uid"],
    batchId: json["batch_id"],
    subjectId: json["subject_id"],
    chapterId: json["chapter_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    date: DateTime.parse(json["date"]),
    entryDateTime: DateTime.parse(json["entry_date_time"]),
    subjectName: json["subject_name"],
    chapterName: json["chapter_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "batch": batch,
    "zoom_api_key": zoomApiKey,
    "zoom_api_secret": zoomApiSecret,
    "meeting_number": meetingNumber,
    "password": password,
    "status": status,
    "admin_id": adminId,
    "added_at": addedAt.toIso8601String(),
    "uid": uid,
    "batch_id": batchId,
    "subject_id": subjectId,
    "chapter_id": chapterId,
    "start_time": startTime,
    "end_time": endTime,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "entry_date_time": entryDateTime.toIso8601String(),
    "subject_name": subjectName,
    "chapter_name": chapterName,
  };
}
