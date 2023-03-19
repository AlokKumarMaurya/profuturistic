import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
final TextEditingController _loginEmailTextEditingController=TextEditingController();
final TextEditingController _loginPasswordTextEditingController=TextEditingController();
final TextEditingController _loginNameTextEditingController=TextEditingController();
 RxBool _isEmailValid=false.obs;

TextEditingController get authEmailTextEditingController=>_loginEmailTextEditingController;
TextEditingController get authPasswordTextEditingController=>_loginPasswordTextEditingController;
TextEditingController get authNameTextEditingController=>_loginNameTextEditingController;
RxBool get isEmailValid=>_isEmailValid;

void validateEmail({required val}){
  _isEmailValid.value= GetUtils.isEmail(val);
  update();
}



void login(){
  Get.offNamed(Routes.HOME);
}


}
