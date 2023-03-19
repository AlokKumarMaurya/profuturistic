import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../../../data/helperWidget/appDimensions.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppHelperWidget().appIcon(),
        AppDimensions().vSpace5(),
        AppHelperWidget().appText(
            text: "Free Career Counselling To Students",
            textOverflow: TextOverflow.visible),
        AppDimensions().vSpace30(),
        AppDimensions().vSpace10(),
        AppHelperWidget().appText(
            fontSize: AppDimensions().h30,
            text: "Sign Up",
            fontWeight: FontWeight.w600,
            color: Theme.of(context).canvasColor),
        AppDimensions().vSpace10(),
        AppHelperWidget().appButton(
            onClick: () => Get.offNamed(Routes.SIGNUP),
            buttonRadius: AppDimensions().h30,
            buttonHeight: 60,
            buttonWidth: Get.width / 1.4,
            text: "Continue with Mail",
            fontWeight: FontWeight.w500,
            buttonBgColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).scaffoldBackgroundColor,
            textSize: 16,
            leading: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(AppDimensions().h05),
              height: AppDimensions().h30,
              width: AppDimensions().h30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Icon(
                Icons.email_rounded,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
            )),
        AppDimensions().vSpace10(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions().h10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppHelperWidget().appButton(
                  leading: Image.asset(AppConstants.googleImage),
                  textColor: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.w400,
                  buttonBgColor: Theme.of(context).scaffoldBackgroundColor,
                  buttonBorderColor: Theme.of(context).canvasColor,
                  buttonRadius: AppDimensions().h30,
                  text: "Google",
                  buttonWidth: Get.width / 2.3,
                  buttonHeight: 45,
                  onClick: () => AppHelperFunction().showGoodSnackBar(message: "Login with google")),
              AppHelperWidget().appButton(
                  leading: Icon(
                    Icons.facebook,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  buttonBorderColor: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.w400,
                  textColor: Theme.of(context).primaryColor,
                  buttonBgColor: Theme.of(context).scaffoldBackgroundColor,
                  buttonRadius: AppDimensions().h30,
                  text: "Facebook",
                  buttonWidth: Get.width / 2.3,
                  buttonHeight: 45,
                  onClick: () =>AppHelperFunction().showErrorSnackBar(message: "Login with facebook"))
            ],
          ),
        )
      ],
    ));
  }
}
