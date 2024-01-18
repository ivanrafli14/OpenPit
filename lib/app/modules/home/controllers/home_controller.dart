import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseAuthController fireAuthC = Get.find<FirebaseAuthController>();
  final isLogin = false.obs;
  int index = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLogin.value = await fireAuthC.isUserLogged();
  }

  void clickButton(int idx) {
    index = idx;
    Get.toNamed(Routes.DETAIL);
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
