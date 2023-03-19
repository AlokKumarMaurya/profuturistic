import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/views/views/video_lecture_grid_view.dart';

import '../controllers/video_lecture_controller.dart';

class VideoLectureView extends GetView<VideoLectureController> {
  const VideoLectureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppHelperWidget().appBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions().h15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHelperWidget().appText(
                  text: "Video Lecture",
                  color: Theme.of(context).canvasColor,
                  fontSize: 22,
                ),
                AppDimensions().vSpace20(),
                _mainTile(),
                 AppDimensions().vSpace30(),
                 Expanded(
                    child: VideoLectureGridView(
                  list: controller.modulesList,
                )),
              ],
            ),
          )),
    );
  }

  Widget _mainTile() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: Theme.of(Get.context!).disabledColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage(AppConstants.appLogoImage))),
    );
  }
}
