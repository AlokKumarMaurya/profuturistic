// To parse this JSON data, do
//
//     final syllabusModal = syllabusModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SyllabusModal syllabusModalFromJson(String str) => SyllabusModal.fromJson(json.decode(str));

String syllabusModalToJson(SyllabusModal data) => json.encode(data.toJson());

class SyllabusModal {
  bool status;
  String message;
  Map<String, Datum> data;

  SyllabusModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SyllabusModal.fromJson(Map<String, dynamic> json) => SyllabusModal(
    status: json["status"],
    message: json["message"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Datum {
  String subjectName;
  List<Chapterdatum> chapterdata;

  Datum({
    required this.subjectName,
    required this.chapterdata,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subjectName: json["subject_name"],
    chapterdata: List<Chapterdatum>.from(json["chapterdata"].map((x) => Chapterdatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subject_name": subjectName,
    "chapterdata": List<dynamic>.from(chapterdata.map((x) => x.toJson())),
  };
}

class Chapterdatum {
  String id;
  String chapterName;

  Chapterdatum({
    required this.id,
    required this.chapterName,
  });

  factory Chapterdatum.fromJson(Map<String, dynamic> json) => Chapterdatum(
    id: json["id"],
    chapterName: json["chapter_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chapter_name": chapterName,
  };
}
