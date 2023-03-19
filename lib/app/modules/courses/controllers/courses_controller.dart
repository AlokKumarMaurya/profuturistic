import 'package:get/get.dart';

class CoursesController extends GetxController {
  List<Map<String, String>> coursesList = List.generate(
      5,
      (index) => {
            "courseName": "Course $index",
            "image": "https://picsum.photos/500/500"
          });
}
