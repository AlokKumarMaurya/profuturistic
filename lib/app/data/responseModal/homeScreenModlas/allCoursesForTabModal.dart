// To parse this JSON data, do
//
//     final allTabCourseCourseModal = allTabCourseCourseModalFromJson(jsonString);

import 'dart:convert';

AllTabCourseCourseModal allTabCourseCourseModalFromJson(String str) => AllTabCourseCourseModal.fromJson(json.decode(str));

String allTabCourseCourseModalToJson(AllTabCourseCourseModal data) => json.encode(data.toJson());

class AllTabCourseCourseModal {
  AllTabCourseCourseModal({
    required this.status,
    required this.batches,
  });

  bool status;
  List<Batch> batches;

  factory AllTabCourseCourseModal.fromJson(Map<String, dynamic> json) => AllTabCourseCourseModal(
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
    required this.catId,
    required this.subCatId,
    required this.batchName,
    required this.batchImage,
    required this.noOfStudent,
    required this.status,
    required this.batchImageUrl,
  });

  String id;
  String catId;
  String subCatId;
  String batchName;
  String batchImage;
  String noOfStudent;
  String status;
  String batchImageUrl;

  factory Batch.fromJson(Map<String, dynamic> json) => Batch(
    id: json["id"],
    catId: json["cat_id"],
    subCatId: json["sub_cat_id"],
    batchName: json["batch_name"],
    batchImage: json["batch_image"],
    noOfStudent: json["no_of_student"],
    status: json["status"],
    batchImageUrl: json["batch_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_id": catId,
    "sub_cat_id": subCatId,
    "batch_name": batchName,
    "batch_image": batchImage,
    "no_of_student": noOfStudent,
    "status": status,
    "batch_image_url": batchImageUrl,
  };
}
