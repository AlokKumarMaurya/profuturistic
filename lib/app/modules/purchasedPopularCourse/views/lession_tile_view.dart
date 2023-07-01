import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/purchased_popular_course_controller.dart';

class LesionTileView extends GetView<PurchasedPopularCourseController> {
  const LesionTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchasedPopularCourseController>(
        init: PurchasedPopularCourseController(),
        builder: (purchasePopularCourseController) {
          return Stack(
            children: [
              purchasePopularCourseController.enrolledCourseDetailModal != null
                  ? ListView.builder(
                      itemCount: purchasePopularCourseController
                          .enrolledCourseDetailModal!.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      itemBuilder: (context, indexOne) {
                        return ExpansionTile(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          collapsedBackgroundColor:
                              Theme.of(context).shadowColor,
                          backgroundColor: Theme.of(context).primaryColorDark,
                          title: AppHelperWidget().appText(
                              text: purchasePopularCourseController
                                  .enrolledCourseDetailModal!
                                  .data[indexOne]
                                  .subjectName,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          collapsedIconColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          iconColor: Theme.of(context).scaffoldBackgroundColor,
                          children: [
                            ListView.builder(
                              itemCount: purchasePopularCourseController
                                  .enrolledCourseDetailModal!
                                  .data[indexOne]
                                  .chapterdata
                                  .length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, indexTwo) {
                                return ListView.builder(
                                    itemCount: purchasePopularCourseController
                                        .enrolledCourseDetailModal!
                                        .data[indexOne]
                                        .chapterdata[indexTwo].length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        /*id=purchasePopularCourseController
                                            .enrolledCourseDetailModal!
                                            .data[indexOne]
                                            .chapterdata[indexTwo][index]
                                            .url.replaceAll("https://www.youtube.com/watch?v=", "");*/
                                        Get.to(()=>YouTubePlay(url:purchasePopularCourseController
                                            .enrolledCourseDetailModal!
                                            .data[indexOne]
                                            .chapterdata[indexTwo][index]
                                            .url ,));} /*purchasePopularCourseController
                                          .getChapterLink(
                                              id: purchasePopularCourseController
                                                  .enrolledCourseDetailModal!
                                                  .data[indexOne]
                                                  .chapterdata[indexTwo][index]
                                                  .id
                                                  .toString() *//*id*//*)*/,
                                      textColor: Theme.of(context).primaryColorDark,
                                      leading: AppHelperWidget().customIcon(
                                          icon: Icon(
                                            Icons.video_call_outlined,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          padding: 5,
                                          bgFillColor:
                                              Theme.of(context).primaryColorDark,
                                          height: 50,
                                          width: 50),
                                      title: AppHelperWidget().appText(
                                          text: purchasePopularCourseController
                                              .enrolledCourseDetailModal!
                                              .data[indexOne]
                                              .chapterdata[indexTwo][index].topic
                                               /*chapterName*/,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      trailing: AppHelperWidget().appText(
                                          text: purchasePopularCourseController
                                              .enrolledCourseDetailModal!
                                              .data[indexOne]
                                              .chapterdata[indexTwo][index].id
                                              .toString() /*id*/,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    );
                                  }
                                );
                              },
                            )
                          ],
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              if (purchasePopularCourseController.isLoading) ...{
                const Center(
                  child: CircularProgressIndicator(),
                )
              }
            ],
          );
        });
  }
}


class YouTubePlay extends StatefulWidget {
  final String url;
  const YouTubePlay({Key? key,required this.url}) : super(key: key);

  @override
  State<YouTubePlay> createState() => _YouTubePlayState();
}

class _YouTubePlayState extends State<YouTubePlay> {
  String? id;
  YoutubePlayerController? _controller;

  @override
  void initState() {
    id=YoutubePlayer.convertUrlToId(widget.url);
    _controller=  YoutubePlayerController(
      initialVideoId: id!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoutubePlayer(
        aspectRatio: 3,
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor:Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady:() {
      // _controller?.addListener();
      },
      ),
    );
  }
}
