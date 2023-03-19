import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';

import '../../data/helperWidget/appHelperWidget.dart';
import '../../modules/notification/controllers/notification_controller.dart';

class NotificationTileView extends GetView<NotificationController> {
  const NotificationTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: notificationController.notificationList.length,
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              return _listTile(index);
            },
          );
        });
  }

  Widget _listTile(int index) {
    var item = controller.notificationList[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          minVerticalPadding: 10,
          tileColor: index % 4 == 0
              ? Theme.of(Get.context!).scaffoldBackgroundColor
              : Theme.of(Get.context!).disabledColor.withOpacity(0.1),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHelperWidget().appText(
                  text: item["name"]!,
                  fontSize: AppDimensions().h15,
                  color: Theme.of(Get.context!).canvasColor,
                  textHeight: 0),
              AppDimensions().vSpace5(),
              AppHelperWidget().appText(
                  text: item["message"]!,
                  fontSize: AppDimensions().h10,
                  color: Theme.of(Get.context!).canvasColor)
            ],
          ),
          horizontalTitleGap: null,
          dense: true,
          minLeadingWidth: 0,
          visualDensity: const VisualDensity(vertical: 4),
          style: ListTileStyle.list,
          leading: CircleAvatar(
              backgroundColor: Theme.of(Get.context!).primaryColor,
              child: Icon(
                CupertinoIcons.person,
                color: Theme.of(Get.context!).scaffoldBackgroundColor,
              )),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MediaQuery.removePadding(
                context: Get.context!,
                child: IconButton(
                    onPressed: () => AppHelperFunction()
                        .showGoodSnackBar(message: "Tap is working fine"),
                    icon: Icon(
                      color: Theme.of(Get.context!).primaryColor,
                      Icons.more_horiz,
                      size: 30,
                    )),
              ),
              AppHelperWidget().appText(
                  text: item["time"]!,
                  color: Theme.of(Get.context!).canvasColor,
                  fontSize: AppDimensions().h10),
            ],
          ),
        ),
        MediaQuery.removePadding(
            context: Get.context!,
            child: Divider(
              height: 2,
              thickness: 1.2,
              color: Theme.of(Get.context!).disabledColor,
            ))
      ],
    );
  }
}
