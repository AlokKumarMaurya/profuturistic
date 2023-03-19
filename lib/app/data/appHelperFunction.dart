import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';

class AppHelperFunction {

  void appPrint({required String val}) {
    if (kDebugMode) {
      print(val);
    }
  }

  void showGoodSnackBar({required String message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(Get.context!).scaffoldBackgroundColor),
      ),
      backgroundColor: Theme.of(Get.context!).dividerColor,
      duration:const Duration(seconds: 2),
      isDismissible: true,
      padding:const EdgeInsets.all(8),
      margin:const EdgeInsets.all(10),
      snackPosition: SnackPosition.TOP,
      borderRadius: AppDimensions().h30,
      maxWidth: Get.width/1.5,
    ));
  }

  void showErrorSnackBar({required String message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(Get.context!).scaffoldBackgroundColor),
      ),
      backgroundColor: Theme.of(Get.context!).errorColor,
      duration:const Duration(seconds: 2),
      isDismissible: true,
      padding:const EdgeInsets.all(8),
      margin:const EdgeInsets.all(10),
      snackPosition: SnackPosition.TOP,
      borderRadius: AppDimensions().h30,
      maxWidth: Get.width/1.5,
    ));
  }
}
