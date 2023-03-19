import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/helperWidget/appDimensions.dart';
import '../../../data/helperWidget/appHelperWidget.dart';
import '../controllers/home_controller.dart';

class TabFilterView extends GetView<HomeController> {
  const TabFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Column(
            children: [
              SizedBox(
                height: 50,
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.tabList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () =>
                          homeController.handleTabListTap(index: index),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(AppDimensions().h10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: homeController.selectedTab == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).scaffoldBackgroundColor),
                        child: AppHelperWidget().appText(
                            text: homeController.tabList[index],
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: homeController.selectedTab == index
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).canvasColor),
                      ),
                    );
                  },
                ),
              ),
              AppDimensions().vSpace20(),
              _courseGridView()
            ],
          );
        });
  }

  Widget _courseGridView() {
    return GridView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions().h05),
            ),
            child: Column(
              children: [
                AppHelperWidget().imageBuilder(
                    imagePath: "https://picsum.photos/500/500",
                    isAssetImage: false,
                    height: 100,
                    width: Get.width,
                    borderRadius: 10),
                AppDimensions().vSpace5(),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        AppHelperWidget().appText(
                            textHeight: 0.5,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            text: "UPS PRELIMS",
                            color: Theme.of(context).canvasColor),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppHelperWidget().customIcon(
                                icon: Icon(
                                  Icons.group,
                                  color: Theme.of(context).primaryColor,
                                ),
                                padding: 0,
                                bgFillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                height: 30,
                                width: 30),
                            AppHelperWidget().appText(
                                textHeight: 0.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                text: "+50 Members",
                                color: Theme.of(context).disabledColor),
                          ],
                        ),
                      ],
                    ),
                    AppHelperWidget().customIcon(
                        icon: Icon(
                          Icons.file_open_rounded,
                          size: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: 0,
                        bgFillColor: Theme.of(context).scaffoldBackgroundColor,
                        height: 45,
                        width: 50),
                  ],
                )
              ],
            ),
          );
        });
  }
}
