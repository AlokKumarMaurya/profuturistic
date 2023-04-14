import '../../../data/appConstants.dart';
import '../../../data/network/networkApiService.dart';

class HomeApiProvider{
  Future getPopularCourseList() async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: AppConstants.popularCourse);
    if (res != null) {
      return res;
    }
  }
  Future getAllPopularCourseList() async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: AppConstants.allPopularCourse);
    if (res != null) {
      return res;
    }
  }


  Future getAllTabCourseList() async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: AppConstants.allTabCourse);
    if (res != null) {
      return res;
    }
  }

  Future getCourseTabList() async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: AppConstants.courseTabList);
    if (res != null) {
      return res;
    }
  }


  Future getCourseById({required String courseId}) async {
    var res = await NetworkApiService()
        .getPostApiResponse(url: AppConstants.getCourseById+courseId,body: {});
    if (res != null) {
      return res;
    }
  }
}