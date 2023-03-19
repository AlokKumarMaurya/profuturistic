import 'package:get/get.dart';

import '../controllers/course_study_view_controller.dart';

class CourseStudyViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseStudyViewController>(
      () => CourseStudyViewController(),
    );
  }
}
