// To parse this JSON data, do
//
//     final jurusan = jurusanFromJson(jsonString);

import 'dart:convert';

Jurusan jurusanFromJson(String str) => Jurusan.fromJson(json.decode(str));

String jurusanToJson(Jurusan data) => json.encode(data.toJson());

class Jurusan {
  Jurusan({
    this.nomor,
    this.nama,
    this.kategori,
    this.deskripsi,
    this.keahlian,
    this.kerja,
    this.perkuliahan,
    this.alasan,
  });

  int? nomor;
  String? nama;
  String? kategori;
  String? deskripsi;
  String? keahlian;
  String? kerja;
  String? perkuliahan;
  String? alasan;

  factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        nomor: json["nomor"],
        nama: json["nama"],
        kategori: json["kategori"],
        deskripsi: json["deskripsi"],
        keahlian: json["keahlian"],
        kerja: json["kerja"],
        perkuliahan: json["perkuliahan"],
        alasan: json["alasan"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "kategori": kategori,
        "deskripsi": deskripsi,
        "keahlian": keahlian,
        "kerja": kerja,
        "perkuliahan": perkuliahan,
        "alasan": alasan,
      };
}
