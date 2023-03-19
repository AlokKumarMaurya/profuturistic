import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';
import 'package:profuturistic/app/modules/home/views/popular_course_view.dart';
import 'package:profuturistic/app/modules/home/views/tab_filter_view.dart';

import '../../../data/helperWidget/appHelperWidget.dart';
import 'banner_view_view.dart';

class DashboardView extends GetView<HomeController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHelperWidget().appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions().h15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 150, child: BannerViewView()),
                AppDimensions().vSpace20(),
                AppHelperWidget().appTextField(
                    controller: controller.searchTextEditingController,
                    lableText: "",
                    hintText: "Subject etc",
                    borderRadius: 10,
                    suffix: Container(
                        padding: EdgeInsets.all(AppDimensions().h05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor,
                        ),
                        height: 30,
                        width: 40,
                        child: Icon(
                          CupertinoIcons.list_dash,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )),
                    prefix: Icon(
                      CupertinoIcons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChanged: (val) => AppHelperFunction().appPrint(val: val)),

               const TabFilterView(),
                const PopularCourseView(),
                AppDimensions().vSpace30()
              ],
            ),
          ),
        ));
  }

}
