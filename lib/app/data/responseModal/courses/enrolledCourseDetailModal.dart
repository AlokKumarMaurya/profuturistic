/*
// To parse this JSON data, do
//
//     final enrolledCourseDetailModal = enrolledCourseDetailModalFromJson(jsonString);

import 'dart:convert';

EnrolledCourseDetailModal enrolledCourseDetailModalFromJson(String str) => EnrolledCourseDetailModal.fromJson(json.decode(str));

String enrolledCourseDetailModalToJson(EnrolledCourseDetailModal data) => json.encode(data.toJson());

class EnrolledCourseDetailModal {
  EnrolledCourseDetailModal({
    required this.status,
    required this.batchData,
  });

  bool status;
  List<BatchDatum> batchData;

  factory EnrolledCourseDetailModal.fromJson(Map<String, dynamic> json) => EnrolledCourseDetailModal(
    status: json["status"],
    batchData: List<BatchDatum>.from(json["batchData"].map((x) => BatchDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "batchData": List<dynamic>.from(batchData.map((x) => x.toJson())),
  };
}

class BatchDatum {
  BatchDatum({
    required this.subjectName,
    required this.chapterdata,
  });

  String subjectName;
  List<Chapterdatum> chapterdata;

  factory BatchDatum.fromJson(Map<String, dynamic> json) => BatchDatum(
    subjectName: json["subject_name"],
    chapterdata: List<Chapterdatum>.from(json["chapterdata"].map((x) => Chapterdatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subject_name": subjectName,
    "chapterdata": List<dynamic>.from(chapterdata.map((x) => x.toJson())),
  };
}

class Chapterdatum {
  Chapterdatum({
    required this.id,
    required this.chapterName,
  });

  String id;
  String chapterName;

  factory Chapterdatum.fromJson(Map<String, dynamic> json) => Chapterdatum(
    id: json["id"],
    chapterName: json["chapter_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chapter_name": chapterName,
  };
}
*/


// To parse this JSON data, do
//
//     final enrolledCourseDetailModal = enrolledCourseDetailModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EnrolledCourseDetailModal enrolledCourseDetailModalFromJson(String str) => EnrolledCourseDetailModal.fromJson(json.decode(str));

String enrolledCourseDetailModalToJson(EnrolledCourseDetailModal data) => json.encode(data.toJson());

class EnrolledCourseDetailModal {
  bool status;
  String message;
  List<BatchDatum> data;

  EnrolledCourseDetailModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EnrolledCourseDetailModal.fromJson(Map<String, dynamic> json) => EnrolledCourseDetailModal(
    status: json["status"],
    message: json["message"],
    data: List<BatchDatum>.from(json["data"].map((x) => BatchDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BatchDatum {
  String subjectName;
  List<List<Chapterdatum>> chapterdata;

  BatchDatum({
    required this.subjectName,
    required this.chapterdata,
  });

  factory BatchDatum.fromJson(Map<String, dynamic> json) => BatchDatum(
    subjectName: json["subject_name"],
    chapterdata: List<List<Chapterdatum>>.from(json["chapterdata"].map((x) => List<Chapterdatum>.from(x.map((x) => Chapterdatum.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "subject_name": subjectName,
    "chapterdata": List<dynamic>.from(chapterdata.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class Chapterdatum {
  String id;
  String adminId;
  String title;
  String batch;
  String topic;
  String subject;
  String description;
  String url;
  String videoType;
  String previewType;
  String status;
  String addedBy;
  DateTime addedAt;

  Chapterdatum({
    required this.id,
    required this.adminId,
    required this.title,
    required this.batch,
    required this.topic,
    required this.subject,
    required this.description,
    required this.url,
    required this.videoType,
    required this.previewType,
    required this.status,
    required this.addedBy,
    required this.addedAt,
  });

  factory Chapterdatum.fromJson(Map<String, dynamic> json) => Chapterdatum(
    id: json["id"],
    adminId: json["admin_id"],
    title: json["title"],
    batch: json["batch"],
    topic: json["topic"],
    subject: json["subject"],
    description: json["description"],
    url: json["url"],
    videoType: json["video_type"],
    previewType: json["preview_type"],
    status: json["status"],
    addedBy: json["added_by"],
    addedAt: DateTime.parse(json["added_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "title": title,
    "batch": batch,
    "topic": topic,
    "subject": subject,
    "description": description,
    "url": url,
    "video_type": videoType,
    "preview_type": previewType,
    "status": status,
    "added_by": addedBy,
    "added_at": addedAt.toIso8601String(),
  };
}
