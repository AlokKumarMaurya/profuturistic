import 'package:profuturistic/app/data/responseModal/authModal/loginModal.dart';

import '../../../data/appConstants.dart';
import '../../../data/appStorage/sharedPrefrences.dart';
import '../../../data/network/networkApiService.dart';

class EnrolledCoursesProvider{

  Future getPopularCourse() async {
    LoginResponseModal loginResponseModal=AppPreference().getLoginData();
    var res = await NetworkApiService()
        .getGetApiResponse(url: "${AppConstants.getEnrolledCourse}${loginResponseModal.data.uid}");  //url is static //need to save data on login
    if (res != null) {
      return res;
    }
  }

}