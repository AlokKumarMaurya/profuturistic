import 'package:get/get.dart';

class CourseStudyViewController extends GetxController {

  String title=Get.arguments["title"].toString().replaceAll("\n", "");
  int selectedTabIndex=0;


  void handleTabIndex({required int index}){
    selectedTabIndex=index;
    update();
  }

}
