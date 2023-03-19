import 'package:get/get.dart';

import '../controllers/course_detail_view_controller.dart';

class CourseDetailViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailViewController>(
      () => CourseDetailViewController(),
    );
  }
}
