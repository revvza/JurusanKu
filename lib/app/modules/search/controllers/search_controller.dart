import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Jurusan {
  final String nama;
  final String kategori;

  Jurusan({required this.nama, required this.kategori});

  factory Jurusan.fromFirestore(Map<String, dynamic> data) {
    return Jurusan(
      nama: data['nama'] ?? '',
      kategori: data['kategori'] ?? '',
    );
  }
}

class SearchController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final RxString keyword = ''.obs;

  Stream<QuerySnapshot<Object?>> jurusanStream(String keyword) {
    CollectionReference jurusan = firestore.collection("jurusan");

    return jurusan
        .where('nama', isGreaterThanOrEqualTo: keyword)
        .where('nama', isLessThan: keyword + 'z')
        .snapshots();
  }

  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxString errorMsg = ''.obs;

  void searchJurusan(String value) {
    keyword.value = value;
  }
}
