import 'package:get/get.dart';

class CourseDetailViewController extends GetxController {
  int tabIndex = 0;
  String title = Get.arguments["title"];
  List<String> tabTitleList = ["Syllabus", "Topics"];

  void updateTabIndex({required int index}) {
    tabIndex = index;
    update();
  }
}
