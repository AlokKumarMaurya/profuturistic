import 'dart:convert';

import 'package:get/get.dart';
import 'package:profuturistic/app/data/responseModal/courses/enrolledCourseDetailModal.dart';

import '../provider/purchasedPopularCourseProvider.dart';

class PurchasedPopularCourseController extends GetxController {

  EnrolledCourseDetailModal? enrolledCourseDetailModal;




  Future getEnrolledCourseDetail({required String id})async{
    enrolledCourseDetailModal=null;
    await PurchasedPopularCourseProvider().getEnrolledCourseDetail(id: id).then((value) {
      if(value !=null){
        enrolledCourseDetailModal=EnrolledCourseDetailModal.fromJson(jsonDecode(value));
      }else{
        enrolledCourseDetailModal=EnrolledCourseDetailModal(status: true,  batchData: []);
      }
      update();
    });
    return true;
  }

}
