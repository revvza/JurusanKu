import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  Stream<QuerySnapshot<Map<String, dynamic>>> getFavoritSnapshot() {
    CollectionReference favorit = firestore.collection("favorit");

    return favorit.snapshots().map((QuerySnapshot<Object?> snapshot) {
      return snapshot as QuerySnapshot<Map<String, dynamic>>;
    });
  }

  void deleteFavorit(String favoritId) {
    CollectionReference favorit = firestore.collection("favorit");

    favorit.doc(favoritId).delete().then((value) {
      showNotification('Data berhasil dihapus dari favorit');
    }).catchError((error) {
      showNotification('Terjadi kesalahan saat menghapus data');
    });
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
