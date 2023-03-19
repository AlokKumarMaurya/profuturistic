import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../controllers/course_study_view_controller.dart';

class CourseStudyViewView extends GetView<CourseStudyViewController> {
  const CourseStudyViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppHelperWidget().appBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions().h10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _playerView(),
                AppDimensions().vSpace20(),
                Expanded(child: GetBuilder<CourseStudyViewController>(
                    builder: (courseStudyViewController) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () => controller.handleTabIndex(index: 0),
                            child: Column(
                              children: [
                                AppHelperWidget().appText(
                                    textOverflow: null,
                                    maxLine: 2,
                                    text: "Learning material",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).canvasColor),
                                AppDimensions().vSpace5(),
                                Divider(
                                  height: 1,
                                  thickness: 3,
                                  color: controller.selectedTabIndex == 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                )
                              ],
                            ),
                          )),
                          AppDimensions().hSpace10(),
                          InkWell(
                            onTap: () => controller.handleTabIndex(index: 1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AppHelperWidget().appText(
                                    text: "About",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).canvasColor),
                                AppDimensions().vSpace5(),
                                SizedBox(
                                  width: AppDimensions().h30 * 3,
                                  child: Divider(
                                    height: 2,
                                    thickness: 3,
                                    color: controller.selectedTabIndex == 1
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .scaffoldBackgroundColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          AppDimensions().hSpace10(),
                          InkWell(
                            onTap: () => controller.handleTabIndex(index: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AppHelperWidget().appText(
                                    text: "Exam",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).canvasColor),
                                AppDimensions().vSpace5(),
                                SizedBox(
                                  width: AppDimensions().h30 * 3,
                                  child: Divider(
                                    height: 2,
                                    thickness: 3,
                                    color: controller.selectedTabIndex == 2
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .scaffoldBackgroundColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      AppDimensions().vSpace15(),
                      controller.selectedTabIndex == 0
                          ? _listBuilder()
                          : controller.selectedTabIndex == 1
                              ? _aboutBuilder()
                              : _examBuilder()
                    ],
                  );
                }))
              ],
            ),
          )),
    );
  }

  Widget _playerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppHelperWidget().imageBuilder(
            imagePath: "https://picsum.photos/500/500",
            isAssetImage: false,
            height: 180,
            width: Get.width,
            borderRadius: 10),
        AppDimensions().vSpace15(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200,
              child: AppHelperWidget().appText(
                  textHeight: 1.2,
                  maxLine: 2,
                  text: controller.title,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(Get.context!).canvasColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppDimensions().h10,
                      horizontal: AppDimensions().h10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(Get.context!).indicatorColor),
                  child: AppHelperWidget().appText(
                      text: "Live class",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Theme.of(Get.context!).scaffoldBackgroundColor),
                ),
                AppHelperWidget().appText(
                    textHeight: 1.2,
                    maxLine: 2,
                    text: "By Ronit Sir",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(Get.context!).canvasColor),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _listBuilder() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                vertical: AppDimensions().h10, horizontal: AppDimensions().h10),
            padding: EdgeInsets.symmetric(
                vertical: AppDimensions().h10, horizontal: AppDimensions().h10),
            height: 160,
            width: Get.width,
            decoration: BoxDecoration(
                color: Theme.of(context).indicatorColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimensions().h10,
                          horizontal: AppDimensions().h25),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: AppHelperWidget().appText(
                          text: "Step ${index + 1}",
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    AppDimensions().vSpace10(),
                    AppHelperWidget().appText(
                        text: "Intro to CA",
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    AppDimensions().vSpace15(),
                    AppHelperWidget().appText(
                        text: "Video 8:32 min",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ],
                ),
                IconButton(
                    onPressed: () => AppHelperFunction()
                        .showGoodSnackBar(message: "Tap is working fine"),
                    icon: Icon(
                      Icons.play_circle_outlined,
                      size: 60,
                      color: Theme.of(context).errorColor,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  _aboutBuilder() {
    return const Center(child: Text(" About view"),);
  }

  _examBuilder() {
    return const Center(child: Text(" Exam view"),);
  }
}
