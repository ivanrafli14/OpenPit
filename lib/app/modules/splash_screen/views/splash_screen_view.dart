import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (() {
      Get.offAllNamed(Routes.LOGIN);
    }));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logoopenpit 2.png'),
            SizedBox(height: 12),
            Text(
              'OpenPit',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
            )
          ],
        ),
      ),
    );
  }
}
