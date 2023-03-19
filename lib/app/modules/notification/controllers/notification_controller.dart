import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<Map<String, String>> notificationList = List.generate(
      20,
      (index) => {
            "name": "Name $index",
            "message": "Message of index $index",
            "time": "09:10 min Ago"
          });
}
