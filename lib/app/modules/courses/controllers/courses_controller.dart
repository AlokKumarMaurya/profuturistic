import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/responseModal/courses/enrolledCoursesModal.dart';
import '../providers/enrolledCourseProviders.dart';

class CoursesController extends GetxController {
  EnrolledCourseModal? enrolledCourseModal;



  Future getEnrolledCourse()async{
    enrolledCourseModal=null;
    await EnrolledCoursesProvider().getPopularCourse().then((value) {
      if(value !=null){
        enrolledCourseModal=EnrolledCourseModal.fromJson(jsonDecode(value));
      }else{
        enrolledCourseModal=EnrolledCourseModal(status: true, batches: []);
      }
      update();
    });
    return true;
  }

}
