import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseAuthController fireAuthC = Get.find<FirebaseAuthController>();
  final isLogin = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLogin.value = await fireAuthC.isUserLogged();
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
