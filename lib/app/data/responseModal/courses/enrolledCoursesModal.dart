// To parse this JSON data, do
//
//     final enrolledCourseModal = enrolledCourseModalFromJson(jsonString);

import 'dart:convert';

EnrolledCourseModal enrolledCourseModalFromJson(String str) => EnrolledCourseModal.fromJson(json.decode(str));

String enrolledCourseModalToJson(EnrolledCourseModal data) => json.encode(data.toJson());

class EnrolledCourseModal {
  EnrolledCourseModal({
    required this.status,
    required this.batches,
  });

  bool status;
  List<Batch> batches;

  factory EnrolledCourseModal.fromJson(Map<String, dynamic> json) => EnrolledCourseModal(
    status: json["status"],
    batches: List<Batch>.from(json["batches"].map((x) => Batch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "batches": List<dynamic>.from(batches.map((x) => x.toJson())),
  };
}

class Batch {
  Batch({
    required this.id,
    required this.adminId,
    required this.catId,
    required this.subCatId,
    required this.batchName,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.batchType,
    required this.batchPrice,
    required this.batchOfferPrice,
    required this.description,
    required this.batchImage,
    required this.noOfStudent,
    required this.status,
    this.curriculum,
    this.admissiblity,
    this.certification,
    this.trainerGuide,
    this.placement,
    this.mentorship,
    this.totalDuration,
    this.totalLessons,
    this.totalSessions,
    this.totalQuizzes,
    this.totalActivities,
    required this.studentId,
    required this.batchId,
    required this.createAt,
    required this.addedBy,
    required this.batchImageUrl,
  });

  String id;
  String adminId;
  String catId;
  String subCatId;
  String batchName;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  String batchType;
  String batchPrice;
  String batchOfferPrice;
  String description;
  String batchImage;
  String noOfStudent;
  String status;
  dynamic curriculum;
  dynamic admissiblity;
  dynamic certification;
  dynamic trainerGuide;
  dynamic placement;
  dynamic mentorship;
  dynamic totalDuration;
  dynamic totalLessons;
  dynamic totalSessions;
  dynamic totalQuizzes;
  dynamic totalActivities;
  String studentId;
  String batchId;
  DateTime createAt;
  String addedBy;
  String batchImageUrl;

  factory Batch.fromJson(Map<String, dynamic> json) => Batch(
    id: json["id"],
    adminId: json["admin_id"],
    catId: json["cat_id"],
    subCatId: json["sub_cat_id"],
    batchName: json["batch_name"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    startTime: json["start_time"],
    endTime: json["end_time"],
    batchType: json["batch_type"],
    batchPrice: json["batch_price"],
    batchOfferPrice: json["batch_offer_price"],
    description: json["description"],
    batchImage: json["batch_image"],
    noOfStudent: json["no_of_student"],
    status: json["status"],
    curriculum: json["curriculum"],
    admissiblity: json["admissiblity"],
    certification: json["certification"],
    trainerGuide: json["trainer_guide"],
    placement: json["placement"],
    mentorship: json["mentorship"],
    totalDuration: json["total_duration"],
    totalLessons: json["total_lessons"],
    totalSessions: json["total_sessions"],
    totalQuizzes: json["total_quizzes"],
    totalActivities: json["total_activities"],
    studentId: json["student_id"],
    batchId: json["batch_id"],
    createAt: DateTime.parse(json["create_at"]),
    addedBy: json["added_by"],
    batchImageUrl: json["batch_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "cat_id": catId,
    "sub_cat_id": subCatId,
    "batch_name": batchName,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "end_time": endTime,
    "batch_type": batchType,
    "batch_price": batchPrice,
    "batch_offer_price": batchOfferPrice,
    "description": description,
    "batch_image": batchImage,
    "no_of_student": noOfStudent,
    "status": status,
    "curriculum": curriculum,
    "admissiblity": admissiblity,
    "certification": certification,
    "trainer_guide": trainerGuide,
    "placement": placement,
    "mentorship": mentorship,
    "total_duration": totalDuration,
    "total_lessons": totalLessons,
    "total_sessions": totalSessions,
    "total_quizzes": totalQuizzes,
    "total_activities": totalActivities,
    "student_id": studentId,
    "batch_id": batchId,
    "create_at": createAt.toIso8601String(),
    "added_by": addedBy,
    "batch_image_url": batchImageUrl,
  };
}
