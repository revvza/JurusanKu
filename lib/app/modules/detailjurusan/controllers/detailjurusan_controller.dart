import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailjurusanController extends GetxController {
  //TODO: Implement DetailjurusanController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addFavorit(Map<String, dynamic> data) async {
    CollectionReference favorit = firestore.collection("favorit");

    QuerySnapshot<Object?> snapshot =
        await favorit.where('nama', isEqualTo: data['nama']).limit(1).get();

    if (snapshot.docs.isEmpty) {
      favorit.add(data);
      showNotification('Data berhasil ditambahkan ke Favorit');
    } else {
      showNotification('Data sudah ada di Favorit');
    }
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
