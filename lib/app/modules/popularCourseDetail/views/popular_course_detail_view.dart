import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../../../data/appHelperFunction.dart';
import '../../../routes/app_pages.dart';
import '../controllers/popular_course_detail_controller.dart';

class PopularCourseDetailView extends GetView<PopularCourseDetailController> {
  const PopularCourseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppHelperWidget().appBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child:controller.popularCourseDetailModal !=null?GetBuilder<PopularCourseDetailController>(
                init: PopularCourseDetailController(),
                builder: (controller) {
                  return Column(
                    children: [
                      AppHelperWidget().imageBuilder(
                          imagePath: controller.popularCourseDetailModal!.batches[0].batchImageUrl,
                          isAssetImage: false,
                          height: 150,
                          width: Get.width,
                          borderRadius: 0),
                      AppDimensions().vSpace10(),
                      _titleBuilder(),
                      AppDimensions().vSpace30(),
                      _expansionTileBuilder(),
                      AppDimensions().vSpace30(),
                      AppHelperWidget().appButton(
                          borderWidth: 2.5,
                          buttonBgColor: Theme.of(Get.context!).primaryColor,
                          buttonBorderColor: Theme.of(Get.context!).primaryColor,
                          text: "Enroll Now",
                          textSize: 18,
                          fontWeight: FontWeight.normal,
                          buttonWidth: Get.width / 1.5,
                          buttonHeight: 40,
                          buttonPadding: 0.5,
                          buttonRadius: 0,
                          textColor: Theme.of(Get.context!).scaffoldBackgroundColor,
                          onClick: () => Get.toNamed(Routes.PURCHASED_POPULAR_COURSE)),
                      AppDimensions().vSpace30(),
                    ],
                  );
                },
              ):const SizedBox() ,
            ),
          )),
    );
  }

  Widget _titleBuilder() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHelperWidget().appText(
                    text: controller.popularCourseDetailModal!.batches[0].batchName,
                    fontSize: 22,
                    color: Theme.of(Get.context!).canvasColor),
                AppDimensions().vSpace5(),
                Row(
                  children: [
                    AppHelperWidget().appText(
                        text: "INR ${controller.popularCourseDetailModal!.batches[0].batchOfferPrice}/-",
                        fontSize: 16,
                        color: Theme.of(Get.context!).canvasColor),
                    AppDimensions().hSpace5(),
                    AppHelperWidget().appText(
                        text: "-- Weeks, -- Days",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(Get.context!).canvasColor)
                  ],
                ),
              ],
            ),
          ),
          AppHelperWidget().appButton(
              borderWidth: 2.5,
              buttonBgColor: Theme.of(Get.context!).scaffoldBackgroundColor,
              buttonBorderColor: Theme.of(Get.context!).primaryColor,
              text: "Buy Course",
              textSize: 15,
              fontWeight: FontWeight.normal,
              buttonWidth: Get.width / 3.2,
              buttonHeight: 40,
              buttonPadding: 0.5,
              textColor: Theme.of(Get.context!).primaryColor,
              onClick: () => AppHelperFunction()
                  .showGoodSnackBar(message: "Tap is working fine"))
        ],
      );

  Widget _expansionTileBuilder() => ListView.builder(
        itemCount: controller.popularCourseDetailModal!.batches[0].faq.length,
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: AppDimensions().h05),
            padding: EdgeInsets.symmetric(horizontal: AppDimensions().h05),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: ExpansionTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                tilePadding: EdgeInsets.zero,
                expandedAlignment: Alignment.centerLeft,
                trailing: Transform.rotate(
                  angle: 1.6,
                  child: Icon(
                    size: 30,
                    Icons.send_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: AppHelperWidget().appText(text: controller.popularCourseDetailModal!.batches[0].faq[index].question),
                children:  [
                  Text(controller.popularCourseDetailModal!.batches[0].faq[index].answer),
                ]),
          );
        },
      );
}
