import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (() {
      controller.redirect();
    }));

    return Scaffold(
      body: Container(
        color: Color(0xff1A2ABC),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/openpitlogo-fix.png'),
              SizedBox(height: 12),
              Text(
                'OpenPit',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Color(0xffF7F7F7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
