import 'package:get/get.dart';
import 'package:open_pit/app/modules/home/controllers/home_controller.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController

  HomeController homeC = Get.find<HomeController>();
  final count = 0.obs;
  final basic = 0.obs;
  final enjoy = 0.obs;
  final happy_meal = 0.obs;
  int idx = 0;

  @override
  void onInit() {
    super.onInit();
    idx = homeC.index;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment_happy() => happy_meal.value++;
  void increment_basic() => basic.value++;
  void increment_enjoy() => enjoy.value++;

  void decrement_happy() => happy_meal.value--;
  void decrement_basic() => basic.value--;
  void decrement_enjoy() => enjoy.value--;
}
