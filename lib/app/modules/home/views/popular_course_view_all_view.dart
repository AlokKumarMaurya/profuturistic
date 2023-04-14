import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/helperWidget/appDimensions.dart';
import '../../../data/helperWidget/appHelperWidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../controllers/popularCourseController.dart';

class PopularCourseViewAllView extends GetView<HomeController> {
  const PopularCourseViewAllView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHelperWidget().appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _gridView(),
      )

    );
  }


  Widget _gridView() => GetBuilder<PopularCourseController>(
      init: PopularCourseController(),
      builder: (controller) {
        return controller.allPopularCourse!=null?GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            itemCount: controller.allPopularCourse!.batchCategory.length,
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
                          imagePath:controller.allPopularCourse!.batchCategory[index].imageUrl,
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
                        text: controller.allPopularCourse!.batchCategory[index].name,
                        color: Theme.of(context).canvasColor)
                  ],
                ),
              );
            }):const Center(child: CircularProgressIndicator(),);
      }
  );


}
