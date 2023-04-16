import '../../../data/appConstants.dart';
import '../../../data/network/networkApiService.dart';

class PurchasedPopularCourseProvider {


  Future getEnrolledCourseDetail({required String id}) async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: "${AppConstants.getEnrolledCourseDetail}$id");  //url is static
    if (res != null) {
      return res;
    }
  }


}