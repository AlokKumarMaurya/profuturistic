import '../../../data/appConstants.dart';
import '../../../data/appStorage/sharedPrefrences.dart';
import '../../../data/network/networkApiService.dart';

class PopularCourseDetailViewProvider {


  Future getPopularCourseDetailById({required String courseId}) async {
    var res = await NetworkApiService()
        .getPostApiResponse(url: "${AppConstants.getPopularCourseDetailById}$courseId/${AppPreference().getLoginData().data.uid}",body: {});
    if (res != null) {
      return res;
    }
  }


}