
import 'package:get/get.dart';

import '../../../data/responseModal/popularCourseModal/allPopularCourseModal.dart';
import '../../../data/responseModal/popularCourseModal/popularCoursesModal.dart';
import '../providers/homeProvider.dart';

class PopularCourseController extends GetxController{
  PopularCourseModal? popularCourse;
  AllTPopularCourseModal? allPopularCourse;


  void getPopularCourse()async{
try{
  await HomeApiProvider().getPopularCourseList().then((value) {
    if(value !=null){
      popularCourse=PopularCourseModal.fromJson(value);
      update();
    }
  });
}catch(e){
  popularCourse=PopularCourseModal(status: true, batches:[]);
}
  }


   getAllPopularCourse()async{
try{
  await HomeApiProvider().getAllPopularCourseList().then((value) {
    if(value !=null){
      allPopularCourse=AllTPopularCourseModal.fromJson(value);
      update();
      return "";
    }
  });
}catch(e){
  allPopularCourse=AllTPopularCourseModal(status: true, batches: []);
}
  }

  @override
  void onInit() {
    getPopularCourse();
    // TODO: implement onInit
    super.onInit();
  }
}