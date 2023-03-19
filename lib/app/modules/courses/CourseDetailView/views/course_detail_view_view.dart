import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/course_detail_view_controller.dart';

class CourseDetailViewView extends GetView<CourseDetailViewController> {
  const CourseDetailViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppHelperWidget().appBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions().h10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppHelperWidget().appText(
                    text: "${controller.title} - Session 1",
                    color: Theme.of(context).canvasColor,
                    letterSpacing: 1.2),
                AppDimensions().vSpace15(),
                Expanded(
                  child: GetBuilder<CourseDetailViewController>(
                      builder: (courseDetailViewController) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              2,
                              (index) => InkWell(
                                    onTap: () =>
                                        controller.updateTabIndex(index: index),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: controller.tabIndex == index
                                              ? Theme.of(context).canvasColor
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                      child: AppHelperWidget().appText(
                                          text: controller.tabTitleList[index],
                                          color: controller.tabIndex == index
                                              ? Theme.of(context)
                                                  .scaffoldBackgroundColor
                                              : Theme.of(context).canvasColor),
                                    ),
                                  )),
                        ),
                        AppDimensions().vSpace15(),
                        Expanded(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 8,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _tile();
                          },
                        ))
                      ],
                    );
                  }),
                ),
              ],
            ),
          )),
    );
  }

  Widget _tile() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.COURSE_STUDY_VIEW,
          arguments: {"title": "Introduction on\nCurrent Affair "}),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: AppDimensions().h10),
          padding: EdgeInsets.symmetric(horizontal: AppDimensions().h10),
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
              color: Theme.of(Get.context!).indicatorColor,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 80,
                width: 60,
                decoration: BoxDecoration(
                    color: Theme.of(Get.context!).primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: AppHelperWidget().appText(
                  textAlign: TextAlign.center,
                  maxLine: 2,
                    text: "03 \n Sept",
                    color: Theme.of(Get.context!).scaffoldBackgroundColor),
              ),
              AppDimensions().hSpace15(),
              AppHelperWidget().appText(
                textHeight: 1.2,
                maxLine: 2,
                  text: "Introduction on\nCurrent Affair ",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Theme.of(Get.context!).scaffoldBackgroundColor),
              AppDimensions().hSpace25(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppHelperWidget().appText(
                      text: "50 Min",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Theme.of(Get.context!).scaffoldBackgroundColor),
                  AppDimensions().vSpace15(),
                ],
              )
            ],
          )),
    );
  }
}
