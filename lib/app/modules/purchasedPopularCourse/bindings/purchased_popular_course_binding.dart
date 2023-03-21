import 'package:get/get.dart';

import '../controllers/purchased_popular_course_controller.dart';

class PurchasedPopularCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchasedPopularCourseController>(
      () => PurchasedPopularCourseController(),
    );
  }
}
