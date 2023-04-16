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
