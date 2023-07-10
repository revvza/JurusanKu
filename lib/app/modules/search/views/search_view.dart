import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jurusanku/app/contants/my_colors.dart';
import 'package:jurusanku/app/routes/app_pages.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 24.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'SEARCH',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.maincolor,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'Gunakan huruf besar diawal kalimat untuk pencarian',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: MyColors.neural70,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    // Panggil fungsi pencarian saat nilai teks berubah
                    controller.searchJurusan(value);
                  },
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: MyColors.neural70,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    hintText: 'Cari jurusan',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: MyColors.neural70,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      borderSide: BorderSide(color: MyColors.neural70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      borderSide: BorderSide(color: MyColors.hovercolor),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: MyColors.neural70,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.hasError.value) {
                  return Text('Error: ${controller.errorMsg.value}');
                } else {
                  return StreamBuilder<QuerySnapshot<Object?>>(
                    stream: controller.jurusanStream(controller.keyword.value),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var ListALLDocs = snapshot.data!.docs;
                        ListALLDocs.sort((a, b) {
                          var nomorA =
                              (a.data() as Map<String, dynamic>)["nomor"] ?? 0;
                          var nomorB =
                              (b.data() as Map<String, dynamic>)["nomor"] ?? 0;
                          return nomorA.compareTo(nomorB);
                        });
                        return ListView.builder(
                          itemCount: ListALLDocs.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(top: 11.5, bottom: 11.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        "${(ListALLDocs[index].data() as Map<String, dynamic>)["nomor"]}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${(ListALLDocs[index].data() as Map<String, dynamic>)["nama"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          color: MyColors.hovercolor,
                                        ),
                                      ),
                                      Text(
                                        "${(ListALLDocs[index].data() as Map<String, dynamic>)["kategori"]}",
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
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
