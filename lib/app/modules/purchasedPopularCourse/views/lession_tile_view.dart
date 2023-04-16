import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../controllers/purchased_popular_course_controller.dart';

class LesionTileView extends GetView <PurchasedPopularCourseController>{
  const LesionTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchasedPopularCourseController>(
      init: PurchasedPopularCourseController(),
      builder: (purchasePopularCourseController) {
        return purchasePopularCourseController.enrolledCourseDetailModal!=null? ListView.builder(
          itemCount: purchasePopularCourseController.enrolledCourseDetailModal!.batchData.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          itemBuilder: (context, indexOne) {
            return ExpansionTile(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
              ),
              collapsedBackgroundColor: Theme.of(context).shadowColor,
              backgroundColor: Theme.of(context).primaryColorDark,
              title: AppHelperWidget().appText(
                  text: purchasePopularCourseController.enrolledCourseDetailModal!.batchData[indexOne].subjectName,
                  color: Theme.of(context).scaffoldBackgroundColor),
              collapsedIconColor: Theme.of(context).scaffoldBackgroundColor,
              iconColor: Theme.of(context).scaffoldBackgroundColor,
              children: [
                ListView.builder(
                  itemCount: purchasePopularCourseController.enrolledCourseDetailModal!.batchData[indexOne].chapterdata.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      textColor: Theme.of(context).primaryColorDark,
                      leading: AppHelperWidget().customIcon(
                          icon: Icon(
                            Icons.video_call_outlined,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          padding: 5,
                          bgFillColor: Theme.of(context).primaryColorDark,
                          height: 50,
                          width: 50),
                      title: AppHelperWidget().appText(
                          text: purchasePopularCourseController.enrolledCourseDetailModal!.batchData[indexOne].chapterdata[index].chapterName,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      trailing: AppHelperWidget().appText(
                        text: purchasePopularCourseController.enrolledCourseDetailModal!.batchData[indexOne].chapterdata[index].id,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 18
                      ),
                    );
                  },
                )
              ],
            );
          },
        ):const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
