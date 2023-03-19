import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/routes/app_pages.dart';

import '../../../views/views/courese_tile_view.dart';
import '../controllers/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CoursesController());
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
                  child: ListView.builder(
                itemCount: controller.coursesList.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index) {
                  return CoursesTileView(
                    onTap: () =>
                        Get.toNamed(Routes.COURSE_DETAIL_VIEW, arguments: {
                      "title":controller.coursesList[index]["courseName"]!,
                    }),
                    courseName: controller.coursesList[index]["courseName"]!,
                    courseImage: controller.coursesList[index]["image"]!,
                  );
                },
              ))
            ],
          ),
        ));
  }
}
