import 'package:get/get.dart';
import 'package:profuturistic/app/modules/assignment/controllers/assignmentController.dart';


class AssignmentBinding extends Bindings {
  @override
  void dependencies() {
 Get.lazyPut(() => AssignmentController());
  }
}
