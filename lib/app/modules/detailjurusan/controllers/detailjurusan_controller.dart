import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class DetailjurusanController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addFavorit(Map<String, dynamic> data) async {
    AuthController authC = Get.find<AuthController>();
    User? currentUser = authC.auth.currentUser;
    if (currentUser != null) {
      CollectionReference favorit = firestore.collection("favorit");

      final snapshot = await favorit
          .where('nama', isEqualTo: data['nama'])
          .where('user_id', isEqualTo: currentUser.uid)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        favorit.add({
          ...data,
          'user_id': currentUser.uid,
        });
        showNotification('Data berhasil ditambahkan ke favorit');
      } else {
        showNotification('Data sudah ada di favorit');
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
