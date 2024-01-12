import 'package:get/get.dart';

class BarController extends GetxController {
  //TODO: Implement BarController

  var tabIndex = 0.obs;

  void changeIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
