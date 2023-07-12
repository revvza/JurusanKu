import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailkategoriController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getJurusanByKategori(
      String kategori) {
    CollectionReference jurusan = firestore.collection("jurusan");

    return jurusan
        .where("kategori", isEqualTo: kategori)
        .snapshots()
        .map((snapshot) {
      return snapshot as QuerySnapshot<Map<String, dynamic>>;
    });
  }
}
