import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/routes/app_pages.dart';

import '../../../views/views/courese_tile_view.dart';
import '../../popularCourseDetail/controllers/popular_course_detail_controller.dart';
import '../../purchasedPopularCourse/controllers/purchased_popular_course_controller.dart';
import '../CourseDetailView/controllers/course_detail_view_controller.dart';
import '../controllers/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHelperWidget().appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions().h15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppHelperWidget().appText(
                text: "Enrolled courses",
                color: Theme.of(context).canvasColor,
                fontSize: 22,
              ),
              Expanded(
                  child: GetBuilder<CoursesController>(
                      init: CoursesController(),
                      builder: (courseController) {
                        return courseController.enrolledCourseModal != null
                            ? Stack(
                              children: [
                                ListView.builder(
                                    itemCount: courseController
                                        .enrolledCourseModal!.batches.length,
                                    shrinkWrap: true,
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    keyboardDismissBehavior:
                                        ScrollViewKeyboardDismissBehavior.onDrag,
                                    itemBuilder: (context, index) {
                                      return GetBuilder<CourseDetailViewController>(
                                          init: CourseDetailViewController(),
                                          builder: (courseDetailViewController) {
                                            return GetBuilder<
                                                    PurchasedPopularCourseController>(
                                                init:
                                                    PurchasedPopularCourseController(),
                                                builder:
                                                    (purchasedPopularCourseController) {
                                                  return CoursesTileView(
                                                    onTap: () {
                                                      /*Get.toNamed(
                                                        Routes.COURSE_DETAIL_VIEW,
                                                        arguments: {
                                                          "title": courseController
                                                              .enrolledCourseModal!
                                                              .batches[index]
                                                              .batchName,
                                                        });*/

                                                      courseController.isLoading = true;
                                                      courseController.update();
                                                      purchasedPopularCourseController
                                                          .getEnrolledCourseDetail(
                                                              id: courseController
                                                                  .enrolledCourseModal!
                                                                  .batches[index]
                                                                  .batchId)
                                                          .then((value) {
                                                        courseController.isLoading =
                                                            false;
                                                        courseController.update();
                                                        Get.toNamed(Routes
                                                            .PURCHASED_POPULAR_COURSE);
                                                      });

                                                      /*
                                                    courseDetailViewController
                                                        .getEnrolledCourseDetail(
                                                            id: courseController
                                                                .enrolledCourseModal!
                                                                .batches[index]
                                                                .batchId)
                                                        .then((value) {
                                                      if (value != null) {
                                                        Get.toNamed(
                                                            Routes.COURSE_DETAIL_VIEW,
                                                            arguments: {
                                                              "title": courseController
                                                                  .enrolledCourseModal!
                                                                  .batches[index]
                                                                  .batchName,
                                                            });
                                                      }
                                                    });*/
                                                    },
                                                    courseName: courseController
                                                        .enrolledCourseModal!
                                                        .batches[index]
                                                        .batchName,
                                                    courseImage: courseController
                                                        .enrolledCourseModal!
                                                        .batches[index]
                                                        .batchImageUrl,
                                                  );
                                                });
                                          });
                                    },
                                  ),
                                controller.isLoading?const Center(child: CircularProgressIndicator(),):const SizedBox()
                              ],
                            )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      }))
            ],
          ),
        ));
  }
}
