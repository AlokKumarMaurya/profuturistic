import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

import '../../../data/appConstants.dart';
import '../../../data/appHelperFunction.dart';
import '../../../data/helperWidget/appDimensions.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _clearController();
        Get.offNamed(Routes.LOGIN);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppDimensions().vSpace10(),
                      AppHelperWidget().appTextField(
                          onChanged: (val) => null,
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
                          controller: controller.authNameTextEditingController,
                          lableText: "Name",
                          hintText: "Name"),

                      AppDimensions().vSpace20(),
                     Obx(()=> AppHelperWidget().appTextField(
                          onChanged: (val) => controller.validateEmail(val: val),
                          errorText: "Enter a valid email",
                          isInputValid: controller.isEmailValid.value,
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
                          hintText: "hello@gmail.com")),
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
                      AppHelperWidget().appButton(
                          buttonRadius: AppDimensions().h30,
                          text: "SignUp",
                          textColor: Theme
                              .of(context)
                              .cardColor,
                          buttonWidth: Get.width / 1.2,
                          buttonHeight: 60,
                          onClick: () =>
                              AppHelperFunction()
                                  .showErrorSnackBar(message: "No functionality yet")),
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
                       _clearController();
                          Get.offNamed(Routes.LOGIN);},
                        child: AppHelperWidget().appText(
                            text: "Already Registered?\nLog in here.",
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
                ),
              ),
            ),
          )
      ),
    );
  }

  void _clearController() {
    controller.authNameTextEditingController.clear();
    controller.authEmailTextEditingController.clear();
    controller.authPasswordTextEditingController.clear();
  }
}
