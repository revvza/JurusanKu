import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jurusanku/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showNotification(
            'Tidak ada pengguna yang ditemukan untuk email tersebut');
      } else if (e.code == 'wrong-password') {
        showNotification('Password pengguna salah');
      }
    }
  }

  void register(String fullname, String education, String email,
      String password, String passconfirm) async {
    if (password == passconfirm) {
      try {
        // Create user with email and password
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Create a document in the "users" collection with the user's data
        await firestore.collection('users').doc(userCredential.user!.uid).set({
          'fullname': fullname,
          'email': email,
          'education': education,
        });

        Get.offAllNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showNotification(
              'Tidak ada pengguna yang ditemukan untuk email tersebut');
        } else if (e.code == 'wrong-password') {
          showNotification('Password pengguna salah');
        }
      }
    } else {
      showNotification("Password tidak sama");
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
