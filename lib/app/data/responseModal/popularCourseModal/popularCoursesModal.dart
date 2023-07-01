// // To parse this JSON data, do
// //
// //     final popularCourseModal = popularCourseModalFromJson(jsonString);
//
// import 'dart:convert';
//
// PopularCourseModal popularCourseModalFromJson(String str) => PopularCourseModal.fromJson(json.decode(str));
//
// String popularCourseModalToJson(PopularCourseModal data) => json.encode(data.toJson());
//
// class PopularCourseModal {
//   PopularCourseModal({
//     required this.status,
//     required this.batchCategory,
//   });
//
//   bool status;
//   List<BatchCategory> batchCategory;
//
//   factory PopularCourseModal.fromJson(Map<String, dynamic> json) => PopularCourseModal(
//     status: json["status"],
//     batchCategory: List<BatchCategory>.from(json["batch_category"].map((x) => BatchCategory.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "batch_category": List<dynamic>.from(batchCategory.map((x) => x.toJson())),
//   };
// }
//
// class BatchCategory {
//   BatchCategory({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.status,
//     required this.batchCategoryImage,
//     required this.time,
//     required this.imageUrl,
//   });
//
//   String id;
//   String name;
//   String slug;
//   String status;
//   String batchCategoryImage;
//   DateTime time;
//   String imageUrl;
//
//   factory BatchCategory.fromJson(Map<String, dynamic> json) => BatchCategory(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     status: json["status"],
//     batchCategoryImage: json["batch_category_image"],
//     time: DateTime.parse(json["time"]),
//     imageUrl: json["image_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "slug": slug,
//     "status": status,
//     "batch_category_image": batchCategoryImage,
//     "time": time.toIso8601String(),
//     "image_url": imageUrl,
//   };
// }




// To parse this JSON data, do
//
//     final allTabCourseCourseModal = allTabCourseCourseModalFromJson(jsonString);

import 'dart:convert';

PopularCourseModal popularCourseModalFromJson(String str) => PopularCourseModal.fromJson(json.decode(str));

String popularCourseModalToJson(PopularCourseModal data) => json.encode(data.toJson());

class PopularCourseModal {
  PopularCourseModal({
    required this.status,
    required this.batches,
  });

  bool status;
  List<Batch> batches;

  factory PopularCourseModal.fromJson(Map<String, dynamic> json) => PopularCourseModal(
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
