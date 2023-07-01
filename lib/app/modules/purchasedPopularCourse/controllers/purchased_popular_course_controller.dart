import 'dart:convert';

import 'package:get/get.dart';
import 'package:profuturistic/app/data/responseModal/courses/enrolledCourseDetailModal.dart';

import '../../../data/appConstants.dart';
import '../../../data/network/networkApiService.dart';
import '../provider/purchasedPopularCourseProvider.dart';

class PurchasedPopularCourseController extends GetxController {

  EnrolledCourseDetailModal? enrolledCourseDetailModal;
  bool isLoading=false;
  Future getEnrolledCourseDetail({required String id})async{
    enrolledCourseDetailModal=null;
    await PurchasedPopularCourseProvider().getEnrolledCourseDetail(id: id).then((value) {
      if(value !=null){
        enrolledCourseDetailModal=EnrolledCourseDetailModal.fromJson((value));
      }else{
        enrolledCourseDetailModal=EnrolledCourseDetailModal(status: true, message: '', data: []);
      }
      update();
    });
    return true;
  }

  void getChapterLink({required String id}) async{
    isLoading=true;
    update();
    await NetworkApiService()
        .getGetApiResponse(url: "${AppConstants.getCourseVideo}$id").then((value) {
          isLoading=false;
          update();
          if(value !=null){
            print(value.toString()+"33333333333333333333333");
          }
    });  //url is static
  }

}
