// To parse this JSON data, do
//
//     final popularCourseDetailModal = popularCourseDetailModalFromJson(jsonString);

import 'dart:convert';

PopularCourseDetailModal popularCourseDetailModalFromJson(String str) => PopularCourseDetailModal.fromJson(json.decode(str));

String popularCourseDetailModalToJson(PopularCourseDetailModal data) => json.encode(data.toJson());

class PopularCourseDetailModal {
  PopularCourseDetailModal({
    required this.status,
    required this.batches,
  });

  bool status;
  List<BatchPopularCourseDetail> batches;

  factory PopularCourseDetailModal.fromJson(Map<String, dynamic> json) => PopularCourseDetailModal(
    status: json["status"],
    batches: List<BatchPopularCourseDetail>.from(json["batches"].map((x) => BatchPopularCourseDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "batches": List<dynamic>.from(batches.map((x) => x.toJson())),
  };
}

class BatchPopularCourseDetail {
  BatchPopularCourseDetail({
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
    required this.curriculum,
    required this.admissiblity,
    required this.certification,
    required this.trainerGuide,
    required this.placement,
    required this.mentorship,
    required this.totalDuration,
    required this.totalLessons,
    required this.totalSessions,
    required this.totalQuizzes,
    required this.totalActivities,
    required this.batchImageUrl,
    required this.faq,
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
  String curriculum;
  String admissiblity;
  String certification;
  String trainerGuide;
  String placement;
  String mentorship;
  String totalDuration;
  String totalLessons;
  String totalSessions;
  String totalQuizzes;
  String totalActivities;
  String batchImageUrl;
  List<Faq> faq;

  factory BatchPopularCourseDetail.fromJson(Map<String, dynamic> json) => BatchPopularCourseDetail(
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
    batchImageUrl: json["batch_image_url"],
    faq: List<Faq>.from(json["FAQ"].map((x) => Faq.fromJson(x))),
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
    "batch_image_url": batchImageUrl,
    "FAQ": List<dynamic>.from(faq.map((x) => x.toJson())),
  };
}

class Faq {
  Faq({
    required this.question,
    required this.answer,
  });

  String question;
  String answer;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    question: json["Question"],
    answer: json["Answer"],
  );

  Map<String, dynamic> toJson() => {
    "Question": question,
    "Answer": answer,
  };
}
