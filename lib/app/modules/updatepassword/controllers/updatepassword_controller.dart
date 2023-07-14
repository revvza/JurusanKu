import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatepasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController currC = TextEditingController();
  TextEditingController newC = TextEditingController();
  TextEditingController confirmC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePass() async {
    if (currC.text.isNotEmpty &&
        newC.text.isNotEmpty &&
        confirmC.text.isNotEmpty) {
      if (newC.text == confirmC.text) {
        isLoading.value = true;
        try {
          String emailUser = auth.currentUser!.email!;

          await auth.signInWithEmailAndPassword(
              email: emailUser, password: currC.text);

          await auth.currentUser!.updatePassword(newC.text);

          Get.back();
          Get.back();

          showNotification("Berhasil \n"
              "\n"
              "Berhasil update password. Silahkan login ulang!");
        } on FirebaseAuthException catch (e) {
          if (e.code == "wrong-password") {
            showNotification("Terjadi Kesalahan \n"
                "\n"
                "Password lama yang dimasukkan salah. Tidak dapat update password");
          } else {
            showNotification("Terjadi Kesalahan" "${e.code.toLowerCase()}");
          }
        } catch (e) {
          showNotification(
              "Terjadi Kesalahan \n" "\n" "Tidak dapat update password");
        } finally {
          isLoading.value = false;
        }
      } else {
        showNotification(
            "Terjadi Kesalahan \n" "\n" "Confirm password tidak cocok");
      }
    } else {
      showNotification("Terjadi Kesalahan \n" "\n" "Semua input harus diisi");
    }
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
