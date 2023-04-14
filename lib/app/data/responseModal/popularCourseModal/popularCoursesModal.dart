// To parse this JSON data, do
//
//     final popularCourseModal = popularCourseModalFromJson(jsonString);

import 'dart:convert';

PopularCourseModal popularCourseModalFromJson(String str) => PopularCourseModal.fromJson(json.decode(str));

String popularCourseModalToJson(PopularCourseModal data) => json.encode(data.toJson());

class PopularCourseModal {
  PopularCourseModal({
    required this.status,
    required this.batchCategory,
  });

  bool status;
  List<BatchCategory> batchCategory;

  factory PopularCourseModal.fromJson(Map<String, dynamic> json) => PopularCourseModal(
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
