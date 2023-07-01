import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';

class BannerViewView extends GetView<HomeController> {
   const BannerViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        return homeController.bannerModal!=null? Stack(
          alignment: Alignment.center,
          children: [
             PageView.builder(
              onPageChanged: (int index)=>controller.handleBannerScroll(index),
              controller: controller.bannerPageController,
                itemCount: homeController.bannerModal!.data.sliderImg.length,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: AppHelperWidget().imageBuilder(
                        imagePath: "https://profuturistic.com/uploads/site_data/${homeController.bannerModal!.data.sliderImg[index]}",
                        isAssetImage: false,
                        height: 150,
                        width: Get.width,
                        borderRadius: 15),
                  );
                }),
            Positioned(
              width: Get.width,
              height: 15,
              bottom: 10,
              left: Get.width*0.3,
              child: ListView.builder(itemCount: homeController.bannerModal!.data.sliderImg.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: AppDimensions().h05),
                  height: AppDimensions().h10,
                  width: AppDimensions().h10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:controller.bannerPageController.page==index? Theme.of(context).primaryColor:Theme.of(context).disabledColor
                  ),
                );
              },),
            )
          ],
        ):const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
