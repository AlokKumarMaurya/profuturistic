import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../controllers/ask_doubt_controller.dart';

class AskDoubtView extends GetView<AskDoubtController> {
  const AskDoubtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppHelperWidget().appBar(height: 60),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      )),
                  Expanded(
                      child: Center(
                    child: AppHelperWidget().appText(
                        text: "Ask a doubt",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Theme.of(context).canvasColor),
                  ))
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _onlineImageBuilder(),
                    AppDimensions().hSpace10(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppHelperWidget().appText(
                            text: "Pro app",
                            color: Theme.of(context).scaffoldBackgroundColor),
                        AppDimensions().vSpace5(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppHelperWidget().appText(
                                text: "Online",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).dividerColor),
                            AppDimensions().hSpace5(),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: AppHelperWidget().appText(
                                  text:
                                      "${DateTime.now().hour}:${DateTime.now().minute}",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor
                                      .withOpacity(0.5)),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              _chatView()
            ],
          )),
    );
  }

  Widget _onlineImageBuilder() {
    return Stack(
      children: [
        const Icon(
          CupertinoIcons.profile_circled,
          size: 40,
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(Get.context!).dividerColor),
            ))
      ],
    );
  }

  Widget _chatView() {
    return Expanded(
        child: Container(
            decoration:
                BoxDecoration(color: Theme.of(Get.context!).primaryColorDark),
            child: ListView(
              children: [
                AppDimensions().vSpace5(),
                daysText(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.chatList.length,
                  itemBuilder: (context, index) {
                    return controller.chatList[index].keys.elementAt(0) == 0
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: UnconstrainedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(0.5)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: AppHelperWidget().appText(
                                    color: Theme.of(context).canvasColor,
                                    text: controller.chatList[index].values
                                        .elementAt(0)),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: UnconstrainedBox(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(0.5)),
                                  child: AppHelperWidget().appText(
                                      color: Theme.of(context).canvasColor,
                                      text: controller.chatList[index].values
                                          .elementAt(0))),
                            ),
                          );
                  },
                )
              ],
            )));
  }

  Widget daysText() {
    return AppHelperWidget().appText(
        text: "Today",
        color: Theme.of(Get.context!).scaffoldBackgroundColor,
        fontWeight: FontWeight.w300,
        fontSize: 16);
  }
}
