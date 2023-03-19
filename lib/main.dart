import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/theme/darkTheme.dart';
import 'package:profuturistic/app/data/theme/lightTheme.dart';

import 'app/data/theme/themeController.dart';
import 'app/initialBinding/initialBinding.dart';
import 'app/routes/app_pages.dart';

void main() async{
  InitialBinding().dependencies();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      initialBinding: InitialBinding(),
      theme: Get.find<ThemeController>().isDarkTheme?dark():light(),
      title:AppConstants.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
