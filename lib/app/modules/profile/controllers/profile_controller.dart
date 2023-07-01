import 'package:get/get.dart';
import 'package:profuturistic/app/data/appStorage/sharedPrefrences.dart';
import 'package:profuturistic/app/data/responseModal/authModal/loginModal.dart';

class ProfileController extends GetxController {

  LoginResponseModal? loginResponseModal;

  @override
  void onInit() {
   if(AppPreference().getLoginSate()){
     loginResponseModal=AppPreference().getLoginData();
   }
    super.onInit();
  }
}
