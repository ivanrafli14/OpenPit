import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';
import 'package:open_pit/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      
    );
   FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
   Get.put(FirebaseAuthController(), permanent: true);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
