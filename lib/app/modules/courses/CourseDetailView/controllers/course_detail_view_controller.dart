import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/responseModal/courses/enrolledCourseDetailModal.dart';
import '../providers/enrolledCourseDetailProvider.dart';

class CourseDetailViewController extends GetxController {
  int tabIndex = 0;
  List<String> tabTitleList = ["Syllabus", "Topics"];



  void updateTabIndex({required int index}) {
    tabIndex = index;
    update();
  }





}
