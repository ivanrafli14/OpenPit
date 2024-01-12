import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final FirebaseAuthController authC = Get.find<FirebaseAuthController>();

  void Login() async {
    Map<String, dynamic> res = await authC.signInWithEmailandPassword(
        controller.emailController.text, controller.passwordController.text);

    if (res['error']) {
      Get.snackbar("Error", res["message"]);
    } else {
      Get.offAllNamed(Routes.BAR);
    }
  }

  void LoginWithGoogle() async {
    Map<String, dynamic> res = await authC.signInWithGoogle();

    if (res['error']) {
      Get.snackbar("Error", res["message"]);
    } else {
      Get.offAllNamed(Routes.BAR);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logoopenpit 2.png',
                  width: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: controller.emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: Login,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1ABC54),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: LoginWithGoogle,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/logoGoogle.png',
                            width: 30,
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            'Continue With Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an Account? '),
                    GestureDetector(
                      onTap: () {
                        // Add your registration logic or navigation code here
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1ABC54),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )
                // Expanded(
                //   child: authProvider.status == Status.authenticating ? LoadingView() : SizedBox.shrink()
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
