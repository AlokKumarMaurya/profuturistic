import 'package:profuturistic/app/data/appStorage/sharedPrefrences.dart';

import '../../../data/appConstants.dart';
import '../../../data/network/networkApiService.dart';

class AssignmentProvider {

  Future getAssignment() async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: AppConstants.getAssignment+AppPreference().getLoginData().data.batchId);
    if (res != null) {
      return res;
    }
  }
}