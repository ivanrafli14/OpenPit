import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final FirebaseAuthController authC = Get.find<FirebaseAuthController>();

  void Register() async {
    Map<String, dynamic> res = await authC.signUpWithEmailandPassword(
        controller.emailController.text,
        controller.passwordController.text,
        controller.passconfirmController.text,
        controller.nameController.text);

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
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Name"),
                  ),
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

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: controller.passconfirmController,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Password Confirmation"),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: Register,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff1ABC54),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        'Register',
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

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account? '),
                    GestureDetector(
                      onTap: () {
                        // Add your registration logic or navigation code here
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff1ABC54),
                          fontWeight: FontWeight.w700,
                        ),
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
