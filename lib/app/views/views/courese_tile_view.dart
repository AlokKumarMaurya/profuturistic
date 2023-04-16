import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

class CoursesTileView extends GetView {
  final String courseName;
  final String courseImage;
  final Function onTap;

  const CoursesTileView(
      {Key? key, required this.courseName, required this.courseImage,required this.onTap()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppDimensions().h15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Theme
                  .of(context)
                  .primaryColor,
            )),
        height: 180,
        child:Stack(
          children: [
            AppHelperWidget().imageBuilder(imagePath: courseImage,
                isAssetImage: false,
                height: 180,
                boxFit: BoxFit.cover,
                width: Get.width,
                borderRadius: 15),
            Positioned(
              left: 15,
              bottom: 20,
              child: UnconstrainedBox(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Theme
                      .of(context)
                      .primaryColorDark,
                  child: AppHelperWidget().appText(
                      text: courseName,
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
