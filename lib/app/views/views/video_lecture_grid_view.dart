import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

class VideoLectureGridView extends GetView {
  final List<Map<String, String>> list;

  const VideoLectureGridView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimensions().h20,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1.05),
        itemBuilder: (context, index) {
          var items = list[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: AppHelperWidget().imageBuilder(
                  borderRadius: 15,
                    imagePath: items["image"]!,
                    isAssetImage: false,
                    height: 100,
                    boxFit: BoxFit.cover,
                    width: Get.width),
              ),
              AppDimensions().vSpace5(),
              AppHelperWidget().appText(
                text:  items["title"]!,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).canvasColor,
              )
            ],
          );
        });
  }
}
