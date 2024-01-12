import 'package:get/get.dart';

import '../controllers/bar_controller.dart';

class BarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarController>(
      () => BarController(),
    );

    
  }
}
