import 'dart:io';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_sdk/zoom_options.dart';
import 'package:flutter_zoom_sdk/zoom_view.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/modules/liveClass/liveClassController.dart';
import 'package:profuturistic/app/modules/liveClass/zoomView.dart';

import '../../data/helperWidget/appHelperWidget.dart';

class LiveClassView extends StatelessWidget {
  const LiveClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveClassController>(
        init: LiveClassController(),
        builder: (controller) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppHelperWidget().appBar(),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Live classes",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (controller.zoomDataModalClass != null) ...{
                        ListView.builder(
                          itemCount: controller.zoomDataModalClass!.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var data =
                                controller.zoomDataModalClass!.data[index];
                            return InkWell(
                              onTap: () => joinMeeting(
                                context,
                                meetingPassword: data.password,
                                meetinId: data.meetingNumber,
                                apiKey: data.zoomApiKey,
                                secretKey: data.zoomApiSecret,
                                userId: data.uid
                              ) /*Get.to(() => MeetingWidget(
                                    apiKey: data.zoomApiKey,
                                    appSecretKey: data.zoomApiSecret,
                                    meetId: data.meetingNumber,
                                    meetPassword: data.password,
                                  ))*/
                              ,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.withOpacity(0.3)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.subjectName,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      data.chapterName,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      }
                    ],
                  ),
                ),
              ),
              if (controller.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          );
        });
  }

  joinMeeting(BuildContext context,
      {required String meetinId,
      required String meetingPassword,
      required String apiKey,
      required String secretKey,
      required String userId}) {
    late Timer timer;
    TextEditingController meetingIdController = TextEditingController();
    TextEditingController meetingPasswordController = TextEditingController();
    meetingPasswordController.text = meetingPassword;
    meetingIdController.text = meetinId;

    bool _isMeetingEnded(String status) {
      var result = false;

      if (Platform.isAndroid) {
        result = status == "MEETING_STATUS_DISCONNECTING" ||
            status == "MEETING_STATUS_FAILED";
      } else {
        result = status == "MEETING_STATUS_IDLE";
      }

      return result;
    }

    if (meetingIdController.text.isNotEmpty &&
        meetingPasswordController.text.isNotEmpty) {
      ZoomOptions zoomOptions = ZoomOptions(
          domain: "zoom.us",
          appKey: apiKey,
          //"XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM
          appSecret: secretKey
          //"bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM
          );
      var meetingOptions = ZoomMeetingOptions(
          userId: userId,

          /// pass username for join meeting only --- Any name eg:- EVILRATT.
          meetingId: meetingIdController.text,

          /// pass meeting id for join meeting only
          meetingPassword: meetingPasswordController.text,

          /// pass meeting password for join meeting only
          disableDialIn: "true",
          disableDrive: "true",
          disableInvite: "true",
          disableShare: "true",
          disableTitlebar: "false",
          viewOptions: "true",
          noAudio: "false",
          noDisconnectAudio: "false");

      var zoom = ZoomView();
      zoom.initZoom(zoomOptions).then((results) {
        if (results[0] == 0) {
          zoom.onMeetingStatus().listen((status) {
            if (kDebugMode) {
              print(
                  "[Meeting Status Stream] : " + status[0] + " - " + status[1]);
            }
            if (_isMeetingEnded(status[0])) {
              if (kDebugMode) {
                print("[Meeting Status] :- Ended");
              }
              timer.cancel();
            }
          });
          if (kDebugMode) {
            print("listen on event channel");
          }
          zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
            timer = Timer.periodic(const Duration(seconds: 2), (timer) {
              zoom.meetingStatus(meetingOptions.meetingId!).then((status) {
                if (kDebugMode) {
                  print("[Meeting Status Polling] : " +
                      status[0] +
                      " - " +
                      status[1]);
                }
              });
            });
          });
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("[Error Generated] : " + error);
        }
      });
    } else {
      if (meetingIdController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter a valid meeting id to continue."),
        ));
      } else if (meetingPasswordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter a meeting password to start."),
        ));
      }
    }
  }
}
