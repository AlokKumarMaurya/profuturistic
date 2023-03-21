import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import 'CurrentAssignmentSubmitView.dart';

class CurrentAssignmentView extends GetView {
  const CurrentAssignmentView({Key? key}) : super(key: key);

  List get temp => ["Discussion", "faq", "Submitted"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppHelperWidget().appText(
          text: "Your Currents Assignments",
          color: Theme.of(context).canvasColor,
        ),
        AppDimensions().vSpace15(),
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: temp.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: AppDimensions().h10),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: AppDimensions().h10,
                  horizontal: AppDimensions().h10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions().h10),
                color: Theme.of(context).primaryColor,
              ),
              child: AppHelperWidget().appText(
                text: temp[index],
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
        AppDimensions().vSpace15(),
        ListView.builder(
          itemCount: temp.length,
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: ()=>Get.to(const CurrentAssignmentSubmitView()),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions().h15,
                horizontal: AppDimensions().h10,
              ),
              child: Row(
                children: [
                  AppHelperWidget().appText(
                    text: "0${index + 1}",
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                  ),
                  AppDimensions().hSpace10(),
                  AppHelperWidget().imageBuilder(
                    imagePath: "https://picsum.photos/500/500",
                    isAssetImage: false,
                    height: 70,
                    width: 70,
                    borderRadius: 10,
                  ),
                  AppDimensions().hSpace10(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppHelperWidget().appText(
                        text: "Substance Pressure",
                        color: Theme.of(context).canvasColor,
                      ),
                      AppDimensions().vSpace5(),
                      AppHelperWidget().appText(
                        text: "Maths",
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Theme.of(context).canvasColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
