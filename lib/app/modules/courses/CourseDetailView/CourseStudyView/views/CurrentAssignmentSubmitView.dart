import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

class CurrentAssignmentSubmitView extends GetView {
  const CurrentAssignmentSubmitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppHelperWidget().appBar(height: 70),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppDimensions().h15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppHelperWidget().customIcon(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                      padding: 0,
                      bgFillColor: Theme.of(context).scaffoldBackgroundColor,
                      height: 50,
                      width: 50,
                    ),
                    AppHelperWidget().appText(
                      text: "Natural Science",
                      fontSize: 22,
                      color: Theme.of(context).canvasColor,
                    ),
                    const SizedBox()
                  ],
                ),
                AppDimensions().vSpace15(),
                AppHelperWidget().appText(
                  text: "Substance Pressure",
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).canvasColor,
                ),
                AppDimensions().vSpace15(),
                AppHelperWidget().imageBuilder(
                  imagePath: "https://picsum.photos/500/500",
                  isAssetImage: false,
                  height: 250,
                  width: Get.width,
                  borderRadius: 0,
                ),
                AppDimensions().vSpace15(),
                AppHelperWidget().appText(
                  text:
                      "One Linear Equations & Variable Data Complying One Linear Equations & Variable Data Complying",
                  fontWeight: FontWeight.normal,
                  maxLine: 10,
                  color: Theme.of(context).canvasColor,
                ),
                AppDimensions().vSpace30(),
                AppHelperWidget().appButton(
                    text: "Submit",
                    textSize: 23,
                    buttonWidth: Get.width / 2,
                    buttonHeight: 50,
                    onClick: () => AppHelperFunction()
                        .showGoodSnackBar(message: "Tap is working fine"))
              ],
            ),
          )),
    );
  }
}
