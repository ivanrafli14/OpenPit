import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  FirebaseAuthController fireAuthC = Get.find<FirebaseAuthController>();

  void redirect() async {
    //AuthServiceFirebase authProvider = context.read<AuthServiceFirebase>();
    bool isLogin = await fireAuthC.isUserLogged();
    if(!isLogin) {
       Get.offAllNamed(Routes.LOGIN);
    }
    else{
       Get.offAllNamed(Routes.BAR);
    }
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

  void increment() => count.value++;
}
