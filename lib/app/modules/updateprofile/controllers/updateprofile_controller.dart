import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateprofileController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController fullnameC = TextEditingController();
  TextEditingController educationC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateProfile(String uid) async {
    if (emailC.text.isNotEmpty &&
        fullnameC.text.isNotEmpty &&
        educationC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await firestore.collection("users").doc(uid).update({
          "fullname": fullnameC.text,
          "education": educationC.text,
        });
        Get.back();
        Get.back();
        showNotification("Berhasil \n" "\n" "Berhasil update profile");
      } catch (e) {
        showNotification(
            "Terjadi Kesalahan \n" "\n" "Tidak dapat update profile");
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
