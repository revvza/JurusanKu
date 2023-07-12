import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ForgotpasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void sendEmail() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);
        showNotification("Berhasil \n"
            "\n"
            "Kami telah mengirimkan email reset password. Periksa email kamu");
      } catch (e) {
        showNotification("Terjadi Kesalahan \n"
            "\n"
            "Tidak dapat mengirim email reset password.");
      } finally {
        isLoading.value = false;
      }
    }
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
