import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final FirebaseAuthController authC = Get.find<FirebaseAuthController>();

  final count = 0.obs;
  late var auth = false;
  User? userAuth;

  @override
  void onInit() async {
    auth = await authC.isUserLogged();

    if (auth) {
      User? user = FirebaseAuth.instance.currentUser;
      userAuth = user;
    }
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
