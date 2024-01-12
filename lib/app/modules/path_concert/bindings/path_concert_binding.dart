import 'package:get/get.dart';

import '../controllers/path_concert_controller.dart';

class PathConcertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PathConcertController>(
      () => PathConcertController(),
    );
  }
}
