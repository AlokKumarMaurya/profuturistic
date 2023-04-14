import '../../../data/appConstants.dart';
import '../../../data/network/networkApiService.dart';

class PopularCourseDetailViewProvider {


  Future getPopularCourseDetailById({required String courseId}) async {
    var res = await NetworkApiService()
        .getPostApiResponse(url: AppConstants.getPopularCourseDetailById+courseId,body: {});
    if (res != null) {
      return res;
    }
  }


}