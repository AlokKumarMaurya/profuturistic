import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';

class BottomNavigationBarView extends GetView<HomeController> {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      AppHelperFunction()
          .appPrint(val: controller.homePageController.page.toString());
      return Container(
        height: 70,
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: InkWell(
              onTap: () => controller.handleBottomItemTap(index: 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: controller.homePageController.page == 0.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      height: 5,
                    ),
                    AppHelperWidget().customIcon(
                        icon: Icon(
                          Icons.dashboard_customize_sharp,
                          color: controller.homePageController.page == 0.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).errorColor,
                        ),
                        padding: 8,
                        bgFillColor: Colors.transparent,
                        height: 20,
                        width: 45),
                    AppDimensions().vSpace15(),
                    AppHelperWidget().appText(
                      text: "Home",
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.normal,
                      fontSize: AppDimensions().h10,
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () => controller.handleBottomItemTap(index: 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: controller.homePageController.page == 1.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      height: 5,
                    ),
                    AppDimensions().vSpace5(),
                    AppHelperWidget().customIcon(
                        icon: Icon(
                          Icons.chrome_reader_mode,
                          color: controller.homePageController.page == 1.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).errorColor,
                        ),
                        padding: 8,
                        bgFillColor: Colors.transparent,
                        height: 20,
                        width: 45),
                    AppDimensions().vSpace15(),
                    AppHelperWidget().appText(
                      text: "Courses",
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.normal,
                      fontSize: AppDimensions().h10,
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () => controller.handleBottomItemTap(index: 2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: controller.homePageController.page == 2.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      height: 5,
                    ),
                    AppDimensions().vSpace5(),
                    AppHelperWidget().customIcon(
                        icon: Icon(
                          Icons.notification_add,
                          color: controller.homePageController.page == 2.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).errorColor,
                        ),
                        padding: 8,
                        bgFillColor: Colors.transparent,
                        height: 20,
                        width: 45),
                    AppDimensions().vSpace15(),
                    AppHelperWidget().appText(
                      text: "Notification",
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.normal,
                      fontSize: AppDimensions().h10,
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () => controller.handleBottomItemTap(index: 3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: controller.homePageController.page == 3.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      height: 5,
                    ),
                    AppDimensions().vSpace5(),
                    AppHelperWidget().customIcon(
                        icon: Icon(
                          Icons.person,
                          color: controller.homePageController.page == 3.0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).errorColor,
                        ),
                        padding: 8,
                        bgFillColor: Colors.transparent,
                        height: 20,
                        width: 45),
                    AppDimensions().vSpace15(),
                    AppHelperWidget().appText(
                      text: "Profile",
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.normal,
                      fontSize: AppDimensions().h10,
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      );
    });
  }
}
