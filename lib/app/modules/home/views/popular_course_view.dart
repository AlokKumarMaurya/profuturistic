import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';

class PopularCourseView extends GetView<HomeController> {
  const PopularCourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _bannerView(),
        AppDimensions().vSpace20(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppHelperWidget().appText(
                fontWeight: FontWeight.normal,
                fontSize: 22,
                text: "Popular Courses",
                color: Theme.of(context).canvasColor),
            AppHelperWidget().appButton(
                text: "View All",
                buttonWidth: Get.width / 3,
                buttonHeight: 40,
                buttonRadius: 10,
                fontWeight: FontWeight.w400,
                textSize: 18,
                onClick: () => AppHelperFunction()
                    .showGoodSnackBar(message: "Tap working fine"))
          ],
        ),
        AppDimensions().vSpace15(),
        _gridView()
      ],
    );
  }

  Widget _bannerView() => Stack(
        alignment: const AlignmentDirectional(0, 0),
        children: [
          AppHelperWidget().imageBuilder(
              imagePath: "https://picsum.photos/500/500",
              isAssetImage: false,
              height: 150,
              width: Get.width,
              borderRadius: 0),
          Positioned(
              bottom: 20,
              child: Container(
                padding: EdgeInsets.all(AppDimensions().h05),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).canvasColor,
                ),
                child: AppHelperWidget().appText(
                    fontWeight: FontWeight.normal,
                    text: "The Focal Point of Learning",
                    color: Theme.of(Get.context!).scaffoldBackgroundColor),
              ))
        ],
      );

  Widget _gridView() => GridView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      scrollDirection: Axis.vertical,
      itemCount: 13,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.825,
          crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: ()=>Get.toNamed(Routes.POPULAR_COURSE_DETAIL,preventDuplicates: true),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: AppHelperWidget().imageBuilder(
                    imagePath: "https://picsum.photos/500/500",
                    isAssetImage: false,
                    height: 100,
                    width: double.infinity,
                    borderRadius: 10),
              ),
              AppDimensions().vSpace5(),
              AppHelperWidget().appText(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  text: "Title $index",
                  color: Theme.of(context).canvasColor)
            ],
          ),
        );
      });
}