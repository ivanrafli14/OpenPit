import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/controllers/firebase_auth_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final FirebaseAuthController authC = Get.find<FirebaseAuthController>();
  //final controller = Get.put(ProfileController());

  void Logout() async {
    Map<String, dynamic> res = await authC.signOut();

    if (res['error']) {
      Get.snackbar("Error", res["message"]);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<User?>(
        future: getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            // User is authenticated
            User user = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${user.displayName}!'),
                ElevatedButton(
                  onPressed: () {
                    Logout();
                    // Navigate to the login screen or perform login logic
                  },
                  child: Text('Logout'),
                ),
                // Add other content for authenticated users
              ],
            );
          } else {
            // User is not authenticated
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You are not logged in.'),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login screen or perform login logic
                  },
                  child: Text('Login'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
