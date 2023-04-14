import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/helperWidget/appDimensions.dart';
import '../../../data/helperWidget/appHelperWidget.dart';
import '../../popularCourseDetail/controllers/popular_course_detail_controller.dart';
import '../controllers/home_controller.dart';

class TabFilterView extends GetView<HomeController> {
  const TabFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Column(
            children: [
              homeController.courseTabList != null
                  ? SizedBox(
                      height: 50,
                      width: Get.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.courseTabList!.batches.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => homeController.handleTabListTap(
                                index: index,
                                courseId: homeController
                                    .courseTabList!.batches[index].catId),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(AppDimensions().h10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: homeController.selectedTab == index
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor),
                              child: AppHelperWidget().appText(
                                  text: homeController
                                      .courseTabList!.batches[index].batchName,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: homeController.selectedTab == index
                                      ? Theme.of(context)
                                          .scaffoldBackgroundColor
                                      : Theme.of(context).canvasColor),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              AppDimensions().vSpace20(),
              _courseGridView(),
              AppDimensions().vSpace20(),
            ],
          );
        });
  }

  Widget _courseGridView() {
    return GetBuilder<HomeController>(
        //init: HomeController(),
        builder: (controller) {
      return controller.allTabCourseCourseModal != null
          ? GridView.builder(
              itemCount: controller.allTabCourseCourseModal!.batches.length,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {PopularCourseDetailController temp=Get.put(PopularCourseDetailController());
                    temp.getCourseById(
                        courseId: controller
                            .allTabCourseCourseModal!.batches[index].id);
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimensions().h05),
                    ),
                    child: Column(
                      children: [
                        AppHelperWidget().imageBuilder(
                            imagePath: controller.allTabCourseCourseModal!
                                .batches[index].batchImageUrl,
                            isAssetImage: false,
                            height: 100,
                            width: Get.width,
                            borderRadius: 10),
                        AppDimensions().vSpace5(),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  AppHelperWidget().appText(
                                      textHeight: 1.2,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      textOverflow: TextOverflow.visible,
                                      text: controller.allTabCourseCourseModal!
                                          .batches[index].batchName,
                                      color: Theme.of(context).canvasColor),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppHelperWidget().customIcon(
                                          icon: Icon(
                                            Icons.group,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          padding: 0,
                                          bgFillColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          height: 30,
                                          width: 30),
                                      AppHelperWidget().appText(
                                          textHeight: 0.5,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          text: controller
                                              .allTabCourseCourseModal!
                                              .batches[index]
                                              .noOfStudent,
                                          color:
                                              Theme.of(context).disabledColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            AppHelperWidget().customIcon(
                                icon: Icon(
                                  Icons.file_open_rounded,
                                  size: 40,
                                  color: Theme.of(context).primaryColor,
                                ),
                                padding: 0,
                                bgFillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                height: 45,
                                width: 50),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
