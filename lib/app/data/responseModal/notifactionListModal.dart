// To parse this JSON data, do
//
//     final notificationListModal = notificationListModalFromJson(jsonString);


import 'dart:convert';

NotificationListModal notificationListModalFromJson(String str) => NotificationListModal.fromJson(json.decode(str));

String notificationListModalToJson(NotificationListModal data) => json.encode(data.toJson());

class NotificationListModal {
  bool status;
  String message;
  List<DatumOfNotifactionList> data;

  NotificationListModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationListModal.fromJson(Map<String, dynamic> json) => NotificationListModal(
    status: json["status"],
    message: json["message"],
    data: List<DatumOfNotifactionList>.from(json["data"].map((x) => DatumOfNotifactionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumOfNotifactionList {
  String id;
  String studentId;
  String batchId;
  String notificationType;
  String msg;
  String url;
  String status;
  dynamic time;
  DateTime? seenBy;

  DatumOfNotifactionList({
    required this.id,
    required this.studentId,
    required this.batchId,
    required this.notificationType,
    required this.msg,
    required this.url,
    required this.status,
    required this.time,
    required this.seenBy,
  });

  factory DatumOfNotifactionList.fromJson(Map<String, dynamic> json) => DatumOfNotifactionList(
    id: json["id"],
    studentId: json["student_id"],
    batchId: json["batch_id"],
    notificationType: json["notification_type"],
    msg: json["msg"],
    url: json["url"],
    status: json["status"],
    time: json["time"],
    seenBy:json["seen_by"]!=null? DateTime.parse(json["seen_by"]):null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_id": studentId,
    "batch_id": batchId,
    "notification_type": notificationType,
    "msg": msg,
    "url": url,
    "status": status,
    "time": time,
    "seen_by": seenBy?.toIso8601String(),
  };
}
