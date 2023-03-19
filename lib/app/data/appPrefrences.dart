import 'package:get_storage/get_storage.dart';
import 'package:profuturistic/app/data/appConstants.dart';

class AppPreferences {
  final box = GetStorage();


  void saveLoginStatus({required bool isLogin}){
    box.write(AppConstants.saveLoginKey,isLogin);
  }

  bool getLoginStatus(){
    return box.read(AppConstants.saveLoginKey)??false;
  }

}