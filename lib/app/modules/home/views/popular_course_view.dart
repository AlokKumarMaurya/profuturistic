import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';
import '../../popularCourseDetail/controllers/popular_course_detail_controller.dart';
import '../controllers/popularCourseController.dart';

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
                onClick: () => {
                  Get.find<PopularCourseController>().getAllPopularCourse().then((val){
                    if(val !=""){
                      Get.toNamed(Routes.ALL_POPULAR_COURSE);
                    }
                })
                })
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

  Widget _gridView() => GetBuilder<PopularCourseController>(
    init: PopularCourseController(),
    builder: (controller) {
      return controller.popularCourse!=null?GridView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemCount: controller.popularCourse!.batches.length >9?9: controller.popularCourse!.batches.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.825,
              crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                var temp=Get.put(PopularCourseDetailController());
                temp.getCourseById(courseId:controller.popularCourse!.batches[index].id );
              },//Get.toNamed(Routes.POPULAR_COURSE_DETAIL,preventDuplicates: true),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: AppHelperWidget().imageBuilder(
                        imagePath:controller.popularCourse!.batches[index].batchImageUrl,
                        isAssetImage: false,
                        height: 100,
                        boxShape: BoxShape.rectangle,
                        width: double.infinity,
                        borderRadius: 10),
                  ),
                  AppDimensions().vSpace5(),
                  AppHelperWidget().appText(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      text: controller.popularCourse!.batches[index].batchName,
                      color: Theme.of(context).canvasColor)
                ],
              ),
            );
          }):const Center(child: CircularProgressIndicator(),);
    }
  );
}
