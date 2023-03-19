import 'package:get/get.dart';

import '../controllers/ask_doubt_controller.dart';

class AskDoubtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskDoubtController>(
      () => AskDoubtController(),
    );
  }
}
