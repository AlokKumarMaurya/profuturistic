import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';

import '../../../data/appStorage/sharedPrefrences.dart';
import '../../../data/responseModal/authModal/loginModal.dart';
import '../../../data/responseModal/authModal/signUpResponseModal.dart';
import '../../../routes/app_pages.dart';
import '../provider/authProvider.dart';

class AuthController extends GetxController {
  final TextEditingController _loginEmailTextEditingController =
      TextEditingController();
  final TextEditingController _loginPasswordTextEditingController =
      TextEditingController();
  final TextEditingController _loginNameTextEditingController =
      TextEditingController();
  final RxBool _isEmailValid = false.obs;
  final RxBool _isDataLoading = false.obs;

  TextEditingController get authEmailTextEditingController =>
      _loginEmailTextEditingController;

  TextEditingController get authPasswordTextEditingController =>
      _loginPasswordTextEditingController;

  TextEditingController get authNameTextEditingController =>
      _loginNameTextEditingController;

  RxBool get isEmailValid => _isEmailValid;

  RxBool get isDataLoading => _isDataLoading;
  
  void validateEmail({required val}) {
    _isEmailValid.value = GetUtils.isEmail(val);
    update();
  }



  void signUp() async {
    _isDataLoading(true);
    try {
      Map body = {
        "name": _loginNameTextEditingController.text,
        "email": _loginEmailTextEditingController.text,
        "password": _loginPasswordTextEditingController.text
      };
      if (_loginNameTextEditingController.text.isEmpty) {
        AppHelperFunction().showErrorSnackBar(message: "Please enter name");
      } else if (_loginEmailTextEditingController.text.isEmpty) {
        AppHelperFunction().showErrorSnackBar(message: "Please enter email");
      } else if (!GetUtils.isEmail(_loginEmailTextEditingController.text)) {
        AppHelperFunction().showErrorSnackBar(message: "Enter a valid email");
      } else if (_loginPasswordTextEditingController.text.trim().length < 6) {
        AppHelperFunction().showErrorSnackBar(
            message: "Password must be greater than 6 digit");
      } else {
        var res = await AuthProvider().signUp(body: body);
         SignUpResponseModal val=SignUpResponseModal.fromJson(  res);
          AppHelperFunction().showGoodSnackBar(message: val.message);
          clearData();
          Get.offAllNamed(Routes.LOGIN);
      }
    } finally {
      _isDataLoading(false);
    }
  }


  void login() async {
    _isDataLoading(true);
    try {
      Map body = {
        "email": _loginEmailTextEditingController.text,
        "password": _loginPasswordTextEditingController.text
      };
       if (_loginEmailTextEditingController.text.isEmpty) {
        AppHelperFunction().showErrorSnackBar(message: "Please enter email");
      } else if (!GetUtils.isEmail(_loginEmailTextEditingController.text)) {
        AppHelperFunction().showErrorSnackBar(message: "Enter a valid email");
      } else if (_loginPasswordTextEditingController.text.trim().length < 6) {
        AppHelperFunction().showErrorSnackBar(
            message: "Password must be greater than 6 digit");
      } else {
        var res = await AuthProvider().login(body: body);
        LoginResponseModal val=LoginResponseModal.fromJson(  res);
          AppHelperFunction().showGoodSnackBar(message: val.message);
          clearData();
          Get.offAllNamed(Routes.HOME);
        AppPreference().storeLoginState(isLoggedIn: true);
      }
    } finally {
      _isDataLoading(false);
    }
  }

  clearData(){
    _loginNameTextEditingController.clear();
    _loginEmailTextEditingController.clear();
    _loginPasswordTextEditingController.clear();
  }

}
