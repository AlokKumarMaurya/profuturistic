// To parse this JSON data, do
//
//     final allTPopularCourseModal = allTPopularCourseModalFromJson(jsonString);

import 'dart:convert';

AllTPopularCourseModal allTPopularCourseModalFromJson(String str) => AllTPopularCourseModal.fromJson(json.decode(str));

String allTPopularCourseModalToJson(AllTPopularCourseModal data) => json.encode(data.toJson());

class AllTPopularCourseModal {
  AllTPopularCourseModal({
    required this.status,
    required this.batchCategory,
  });

  bool status;
  List<BatchCategory> batchCategory;

  factory AllTPopularCourseModal.fromJson(Map<String, dynamic> json) => AllTPopularCourseModal(
    status: json["status"],
    batchCategory: List<BatchCategory>.from(json["batch_category"].map((x) => BatchCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "batch_category": List<dynamic>.from(batchCategory.map((x) => x.toJson())),
  };
}

class BatchCategory {
  BatchCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.batchCategoryImage,
    required this.time,
    required this.imageUrl,
  });

  String id;
  String name;
  String slug;
  String status;
  String batchCategoryImage;
  DateTime time;
  String imageUrl;

  factory BatchCategory.fromJson(Map<String, dynamic> json) => BatchCategory(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    status: json["status"],
    batchCategoryImage: json["batch_category_image"],
    time: DateTime.parse(json["time"]),
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "status": status,
    "batch_category_image": batchCategoryImage,
    "time": time.toIso8601String(),
    "image_url": imageUrl,
  };
}
