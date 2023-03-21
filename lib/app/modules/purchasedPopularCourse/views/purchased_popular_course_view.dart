import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../controllers/purchased_popular_course_controller.dart';
import 'lession_tile_view.dart';

class PurchasedPopularCourseView
    extends GetView<PurchasedPopularCourseController> {
  const PurchasedPopularCourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHelperWidget().appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _titleBuilder(),
            const LesionTileView()
          ],
        ),
      ),
    );
  }

  Widget _titleBuilder() => Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions().h10),
        height: 150,
        decoration: BoxDecoration(color: Theme.of(Get.context!).primaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppHelperWidget().appText(
              text: "Current Affair",
              fontSize: 22,
              color: Theme.of(Get.context!).scaffoldBackgroundColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width / 1.3,
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor:
                        Theme.of(Get.context!).disabledColor.withOpacity(0.5),
                    color: Theme.of(Get.context!).canvasColor,
                    minHeight: 10,
                  ),
                ),
                AppHelperWidget().appText(
                  text: "0 %",
                  color: Theme.of(Get.context!).scaffoldBackgroundColor,
                ),
                const SizedBox()
              ],
            )
          ],
        ),
      );
}
