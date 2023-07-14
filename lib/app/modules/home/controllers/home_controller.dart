import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../controllers/auth_controller.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference jurusan = firestore.collection("jurusan");

    return jurusan.snapshots();
  }

  Stream<List<Map<String, dynamic>>> streamFavoritData() {
    CollectionReference favorit = firestore.collection("favorit");

    return favorit.snapshots().map((querySnapshot) {
      List<Map<String, dynamic>> favoritData = [];

      querySnapshot.docs.forEach((document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        data["favoritId"] = document.id;
        favoritData.add(data);
      });

      return favoritData;
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFavoritSnapshotByUser() {
    AuthController authC = Get.find<AuthController>();
    User? currentUser = authC.auth.currentUser;

    if (currentUser != null) {
      CollectionReference favorit = firestore.collection("favorit");

      return favorit
          .where('user_id', isEqualTo: currentUser.uid)
          .snapshots()
          .map((snapshot) {
        return snapshot as QuerySnapshot<Map<String, dynamic>>;
      });
    }

    // Jika pengguna tidak login, kembalikan stream kosong
    return Stream<QuerySnapshot<Map<String, dynamic>>>.empty();
  }

  Stream<List<String>> streamKategoriData() {
    CollectionReference jurusan = firestore.collection("jurusan");

    return jurusan.snapshots().map((querySnapshot) {
      Set<String> kategoriSet = Set<String>();

      querySnapshot.docs.forEach((document) {
        String kategori = (document.data() as Map<String, dynamic>)["kategori"];
        kategoriSet.add(kategori);
      });

      return kategoriSet.toList();
    });
  }

  void removeFavorit(String? favoritId) async {
    try {
      CollectionReference favorit = firestore.collection("favorit");
      await favorit.doc(favoritId).delete();
      showNotification('Jurusan dihapus dari favorit');
    } catch (e) {
      showNotification('Terjadi kesalahan saat menghapus jurusan');
    }
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
