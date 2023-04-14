import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';

import '../../../data/responseModal/popularCourseModal/popularCourseDetailModal.dart';
import '../../../routes/app_pages.dart';
import '../provider/popularCourseDetailViewProvide.dart';

class PopularCourseDetailController extends GetxController {

  PopularCourseDetailModal? popularCourseDetailModal;

  void getCourseById({required String courseId})async{
    Get.find<HomeController>().isDataLoading.value=true;
    popularCourseDetailModal=null;
    try{
      await PopularCourseDetailViewProvider().getPopularCourseDetailById(courseId: courseId).then((value){
        if(value !=null){
          try{
            popularCourseDetailModal=PopularCourseDetailModal.fromJson(value);
            Get.toNamed(Routes.POPULAR_COURSE_DETAIL);
          }catch(e){
            AppHelperFunction().appPrint(val: e.toString());
            AppHelperFunction().showErrorSnackBar(message: value.toString());
          }
        }
      } );
    }catch(e){
      AppHelperFunction().appPrint(val: e.toString());
      popularCourseDetailModal=PopularCourseDetailModal(status: true, batches: []);
    }finally{
      Get.find<HomeController>().isDataLoading.value=false;
      update();
    }
  }
  
  
  
}
