import 'package:get/get.dart';
import 'package:profuturistic/app/modules/assignment/providers/assignmentProviders.dart';

import '../../../data/responseModal/assignmentModal.dart';

class AssignmentController extends GetxController{
  AssignmentModal? assignmentModal;

  bool isDataLoading=false;

  @override
  void onInit() {
    getAssignment();
    super.onInit();
  }

  Future<void> getAssignment() async {
    isDataLoading=true;
    update();
    try{
      await AssignmentProvider().getAssignment().then((value) {
        if(value !=null){
          assignmentModal=AssignmentModal.fromJson(value);
          update();
        }
      });
    }catch(e){
      assignmentModal=null;
    }finally{
      isDataLoading=false;
      update();
    }
  }

}