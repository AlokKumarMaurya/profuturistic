import 'package:get/get.dart';

import '../data/theme/themeController.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    // TODO: implement dependencies
  }

}