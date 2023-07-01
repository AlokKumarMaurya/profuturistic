// To parse this JSON data, do
//
//     final bannerModal = bannerModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BannerModal bannerModalFromJson(String str) => BannerModal.fromJson(json.decode(str));

String bannerModalToJson(BannerModal data) => json.encode(data.toJson());

class BannerModal {
  bool status;
  String message;
  Data data;

  BannerModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannerModal.fromJson(Map<String, dynamic> json) => BannerModal(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<String> sliderHeading;
  List<String> sliderSubheading;
  List<String> sliderDesc;
  List<String> sliderImg;

  Data({
    required this.sliderHeading,
    required this.sliderSubheading,
    required this.sliderDesc,
    required this.sliderImg,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sliderHeading: List<String>.from(json["slider_heading"].map((x) => x)),
    sliderSubheading: List<String>.from(json["slider_subheading"].map((x) => x)),
    sliderDesc: List<String>.from(json["slider_desc"].map((x) => x)),
    sliderImg: List<String>.from(json["slider_img"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "slider_heading": List<dynamic>.from(sliderHeading.map((x) => x)),
    "slider_subheading": List<dynamic>.from(sliderSubheading.map((x) => x)),
    "slider_desc": List<dynamic>.from(sliderDesc.map((x) => x)),
    "slider_img": List<dynamic>.from(sliderImg.map((x) => x)),
  };
}
