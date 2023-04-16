import 'package:get_storage/get_storage.dart';

import '../appConstants.dart';
import '../responseModal/authModal/loginModal.dart';

class AppPreference {
  final box = GetStorage();

  void storeLoginState({required bool isLoggedIn}) {
    box.write(AppConstants.saveLoginKey, isLoggedIn);
  }

  bool getLoginSate() => box.read(AppConstants.saveLoginKey) ?? false;


  void saveLoginData({required LoginResponseModal loginData}) {
    box.write(AppConstants.saveLoginData, loginData);
  }

  LoginResponseModal getLoginData() {
    return box.read(AppConstants.saveLoginData);
  }

  deleteStorage() => box.erase();
}
