import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowLoader {
  void startLoader() => Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

  void stopLoader()=>Get.back();
}
