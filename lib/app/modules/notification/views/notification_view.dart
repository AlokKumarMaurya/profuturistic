import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';

import '../../../views/views/notification_tile_view.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (notificationController) {
        return Stack(
          children: [
            SafeArea(
              child: Scaffold(
                  appBar: PreferredSize(
                      preferredSize: Size(Get.width, 80),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColorDark),
                            child: IconButton(
                                onPressed: () => Get.find<HomeController>()
                                    .handleBottomItemTap(index: 0),
                                icon: Icon(
                                  CupertinoIcons.arrow_turn_up_left,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(),
                                AppHelperWidget().appText(
                                    text: "Notice",
                                    color: Theme.of(context).canvasColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints.tightFor(width: 200),
                                  child: Divider(
                                    height: 5,
                                    color: Theme.of(context).primaryColor,
                                    thickness: 1.5,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppDimensions().vSpace25(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => notificationController.markAllAsRead(),
                            child: AppHelperWidget().appText(
                                text: "Mark all as read",
                                color: Theme.of(context).canvasColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          InkWell(
                            onTap: () => AppHelperFunction()
                                .showGoodSnackBar(message: "Tap is working fine"),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppHelperWidget().appText(
                                    text: "Sort by time",
                                    color: Theme.of(context).canvasColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                MediaQuery.removePadding(
                                    context: context,
                                    child: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 18,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                       Expanded(child:notificationController.notificationListModal!=null? NotificationTileView():const SizedBox(),)
                    ],
                  )),
            ),
            if(notificationController.isLoading)...{
              const Center(
                child: CircularProgressIndicator(),
              )
            }
          ],
        );
      }
    );
  }
}

/*class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(100, size.height);
    path.quadraticBezierTo(100, 200,
        200, 200);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}*/
