import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/responseModal/courses/enrolledCoursesModal.dart';
import '../providers/enrolledCourseProviders.dart';

class CoursesController extends GetxController {
  bool isLoading=false;
  EnrolledCourseModal? enrolledCourseModal;



  Future getEnrolledCourse()async{
    enrolledCourseModal=null;
try{
  await EnrolledCoursesProvider().getPopularCourse().then((value) {
    if(value !=null){
      enrolledCourseModal=EnrolledCourseModal.fromJson(jsonDecode(value));
    }else{
      enrolledCourseModal=EnrolledCourseModal(status: true, batches: []);
    }
    update();
  });
}catch(e){
  enrolledCourseModal=EnrolledCourseModal(status: true, batches: []);
}
    return true;
  }

}
