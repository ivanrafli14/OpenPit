import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;

  Future<Map<String, dynamic>> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      _firestore.collection('users').doc(userCredential.user!.uid).set(
          {'uid': userCredential.user!.uid, 'email': email},
          SetOptions(merge: true));

      return {
        "error": false,
        "message": "Berhasil login.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    }
  }

  Future<Map<String, dynamic>> signUpWithEmailandPassword(
      String email, String password, String passConfirm, String name) async {
    // if (password != passConfirm) {
    //   Get.snackbar("error", "Password does not match. Please re-type again.");

    // }
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'email': email, 'name': name});

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
      }
      return {
        "error": false,
        "message": "Berhasil Register.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    }
  }

  Future<Map<String, dynamic>> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'name': userCredential.user!.displayName
      });

      // Once signed in, return the UserCredential
      return {
        "error": false,
        "message": "Berhasil login.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    }
  }

  Future<Map<String, dynamic>> signOut() async {
    try {
      await _firebaseAuth.signOut();

      return {
        "error": false,
        "message": "Berhasil logout.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    }
  }

  String? uid;

  late FirebaseAuth auth;

  // Future<Map<String, dynamic>> login(String email, String pass) async {
  //   try {
  //     await auth.signInWithEmailAndPassword(email: email, password: pass);

  //     return {
  //       "error": false,
  //       "message": "Berhasil login.",
  //     };
  //   } on FirebaseAuthException catch (e) {
  //     return {
  //       "error": true,
  //       "message": "${e.message}",
  //     };
  //   } catch (e) {
  //     // Error general
  //     return {
  //       "error": true,
  //       "message": "Tidak dapat login.",
  //     };
  //   }
  // }

  Future<bool> isUserLogged() async {
     user = await _firebaseAuth.authStateChanges().first;

    return user != null;
  }
}
