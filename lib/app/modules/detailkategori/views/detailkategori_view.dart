import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailkategori_controller.dart';

import 'package:jurusanku/app/contants/my_colors.dart';

import 'package:jurusanku/app/routes/app_pages.dart';

class DetailkategoriView extends GetView<DetailkategoriController> {
  @override
  Widget build(BuildContext context) {
    final String kategori = Get.arguments as String;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 24.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '$kategori',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.maincolor,
      ),
      body: DefaultTabController(
        length: 1,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TabBarView(
            children: [
              // Tab Bar Kategori
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:
                    controller.getJurusanByKategori(Get.arguments as String),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var ListALLDocs = snapshot.data!.docs;

                    ListALLDocs.sort((a, b) {
                      var nomorA = (a.data())["nomor"] ?? 0;
                      var nomorB = (b.data())["nomor"] ?? 0;
                      return nomorA.compareTo(nomorB);
                    });
                    return ListView.builder(
                      itemCount: ListALLDocs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 11.5, bottom: 11.5, left: 10, right: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Lingkaran dengan angka
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: MyColors.hovercolor, width: 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "${(ListALLDocs[index].data())["nomor"]}",
                                    style: TextStyle(
                                      color: MyColors.hovercolor,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              // Label jurusan dan kategori
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${(ListALLDocs[index].data())["nama"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: MyColors.hovercolor,
                                    ),
                                  ),
                                  Text(
                                    "${(ListALLDocs[index].data())["kategori"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      color: MyColors.neural70,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              // Icon more
                              IconButton(
                                icon: Icon(Icons.read_more_outlined),
                                iconSize: 24.0,
                                color: MyColors.hovercolor,
                                onPressed: () => Get.toNamed(
                                    Routes.DETAILJURUSAN,
                                    arguments: ListALLDocs[index].data()),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
