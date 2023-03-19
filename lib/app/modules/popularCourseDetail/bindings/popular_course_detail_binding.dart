import 'package:get/get.dart';

import '../controllers/popular_course_detail_controller.dart';

class PopularCourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularCourseDetailController>(
      () => PopularCourseDetailController(),
    );
  }
}
