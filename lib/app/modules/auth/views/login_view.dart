import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/auth/controllers/auth_controller.dart';

import '../../../data/appConstants.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             AppHelperWidget().appTextField(
                  onChanged: (val) => controller.validateEmail(val: val),
                  errorText: "Enter a valid email",
                  isInputValid: true,//controller.isEmailValid.value,
                  textAlign: TextAlign.left,
                  borderColor: Theme
                      .of(context)
                      .primaryColor,
                  borderWidth: 2,
                  isDense: true,
                  isFilled: false,
                  lableTextColor: Theme
                      .of(context)
                      .canvasColor,
                  borderRadius: AppDimensions().h15,
                  controller: controller.authEmailTextEditingController,
                  lableText: "Email",
                  hintText: "hello@gmail.com"),
              AppDimensions().vSpace20(),
              AppHelperWidget().appTextField(
                  onChanged: (val) => null,
                  isObscure: true,
                  suffix: Icon(
                    Icons.lock,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    size: 30,
                  ),
                  textAlign: TextAlign.left,
                  borderColor: Theme
                      .of(context)
                      .primaryColor,
                  borderWidth: 2,
                  isDense: true,
                  isFilled: false,
                  lableTextColor: Theme
                      .of(context)
                      .canvasColor,
                  borderRadius: AppDimensions().h15,
                  controller: controller.authPasswordTextEditingController,
                  lableText: "Password",
                  hintText: "******"),
              AppDimensions().vSpace20(),
            Obx(()=>controller.isDataLoading.value?const Center(child: CircularProgressIndicator(),):  AppHelperWidget().appButton(
                buttonRadius: AppDimensions().h30,
                text: "Sign IN",
                letterSpacing: 1.2,
                textColor: Theme
                    .of(context)
                    .cardColor,
                buttonWidth: Get.width / 1.2,
                buttonHeight: 60,
                onClick: () {
                  AppHelperFunction().hideKeyBoard();
                  controller.login();})),
              AppDimensions().vSpace10(),
              AppHelperWidget().appButton(
                  borderWidth: 2,
                  buttonBorderColor: Theme
                      .of(context)
                      .canvasColor,
                  leading: Image.asset(AppConstants.googleImage),
                  buttonBgColor: Theme
                      .of(context)
                      .scaffoldBackgroundColor,
                  buttonRadius: AppDimensions().h30,
                  text: "Google    ",
                  textColor: Theme
                      .of(context)
                      .canvasColor,
                  buttonWidth: Get.width / 1.2,
                  buttonHeight: 45,
                  onClick: () =>
                      AppHelperFunction()
                          .showErrorSnackBar(message: "No functionality yet")),
              AppDimensions().vSpace10(),
              AppHelperWidget().appButton(
                  borderWidth: 2,
                  leading: Icon(
                    Icons.facebook,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  buttonBgColor: Theme
                      .of(context)
                      .scaffoldBackgroundColor,
                  buttonRadius: AppDimensions().h30,
                  text: "Facebook",
                  textColor: Theme
                      .of(context)
                      .primaryColor,
                  buttonWidth: Get.width / 1.2,
                  buttonHeight: 45,
                  onClick: () =>
                      AppHelperFunction()
                          .showErrorSnackBar(message: "No functionality yet")),
              AppDimensions().vSpace20(),
              InkWell(
                onTap: (){
                  controller.authPasswordTextEditingController.clear();
                  controller.authEmailTextEditingController.clear();
                  Get.toNamed(Routes.AUTH);},
                child: AppHelperWidget().appText(
                    text: "Not have account? \n Signup here",
                    fontSize: AppDimensions().h15,
                    color: Theme
                        .of(context)
                        .canvasColor,
                    fontWeight: FontWeight.w400),
              ),
              AppDimensions().vSpace30(),
              AppDimensions().vSpace30(),
            ],
          ),
        ));
  }
}
