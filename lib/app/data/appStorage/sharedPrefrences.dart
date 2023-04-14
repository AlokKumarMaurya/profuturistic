import 'package:get_storage/get_storage.dart';

import '../appConstants.dart';

class AppPreference {
  final box = GetStorage();

  void storeLoginState({required bool isLoggedIn}) {
    box.write(AppConstants.saveLoginKey, isLoggedIn);
  }

  bool getLoginSate() => box.read(AppConstants.saveLoginKey) ?? false;


  deleteStorage()=>box.erase();
}
