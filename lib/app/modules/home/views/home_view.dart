import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jurusanku/app/contants/my_colors.dart';
import 'package:jurusanku/app/controllers/auth_controller.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

import 'package:jurusanku/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('JURUSANKU',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: MyColors.neural10,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 24.0,
            onPressed: () => Get.toNamed(Routes.SEARCH),
          ),
        ],
        backgroundColor: MyColors.maincolor,
      ),
      drawer: Drawer(
        child: ProfileView(),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/home.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyColors.blue20,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Daftar Jurusan Kuliah Di Indonesia \n Selamat Mencari!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: MyColors.neural10,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TabBar(
                labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: MyColors.hovercolor),
                indicatorColor: MyColors.hovercolor,
                labelColor: MyColors.hovercolor,
                unselectedLabelColor: MyColors.neural70,
                tabs: [
                  Tab(
                    text: "Jurusan",
                  ),
                  Tab(
                    text: "Kategori",
                  ),
                  Tab(
                    text: "Favorit",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Tab Bar Jurusan
                    StreamBuilder<QuerySnapshot<Object?>>(
                      stream: controller.streamData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          var ListALLDocs = snapshot.data!.docs;

                          ListALLDocs.sort((a, b) {
                            var nomorA =
                                (a.data() as Map<String, dynamic>)["nomor"] ??
                                    0;
                            var nomorB =
                                (b.data() as Map<String, dynamic>)["nomor"] ??
                                    0;
                            return nomorA.compareTo(nomorB);
                          });
                          return ListView.builder(
                            itemCount: ListALLDocs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    top: 11.5,
                                    bottom: 11.5,
                                    left: 10,
                                    right: 21),
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
                                            color: MyColors.hovercolor,
                                            width: 1),
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
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    // Tab Bar Kategori
                    StreamBuilder<List<String>>(
                      stream: controller.streamKategoriData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          List<String> kategoriList = snapshot.data ?? [];

                          return ListView.builder(
                            itemCount: kategoriList.length,
                            itemBuilder: (context, index) {
                              String kategori = kategoriList[index];
                              return Container(
                                padding: EdgeInsets.only(
                                    top: 11.5,
                                    bottom: 11.5,
                                    left: 10,
                                    right: 21),
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
                                            color: MyColors.hovercolor,
                                            width: 1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
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
                                          '${kategori}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Poppins',
                                            fontSize: 13,
                                            color: MyColors.hovercolor,
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
                                          Routes.DETAILKATEGORI,
                                          arguments: kategori),
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
                    // Tab Bar Favorit
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: controller.getFavoritSnapshotByUser(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final favoritData = snapshot.data!.docs
                              .map((doc) => doc.data())
                              .toList();

                          if (favoritData.isEmpty) {
                            return Center(
                              child: Text(
                                "Favorit Tidak Tersedia",
                                style: TextStyle(
                                  color: MyColors.hovercolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            );
                          }

                          if (favoritData.isEmpty) {
                            return Center(
                              child: Text(
                                "Favorit Tidak Tersedia",
                                style: TextStyle(
                                  color: MyColors.hovercolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            );
                          }

                          favoritData.sort((a, b) {
                            var nomorA = a["nomor"] ?? 0;
                            var nomorB = b["nomor"] ?? 0;
                            return nomorA.compareTo(nomorB);
                          });

                          return ListView.builder(
                            itemCount: favoritData.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.DETAILJURUSAN,
                                    arguments: favoritData[index],
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 11.5,
                                    bottom: 11.5,
                                    left: 10,
                                    right: 21,
                                  ),
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
                                            color: MyColors.hovercolor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${favoritData[index]["nomor"]}",
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
                                            "${favoritData[index]["nama"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: MyColors.hovercolor,
                                            ),
                                          ),
                                          Text(
                                            "${favoritData[index]["kategori"]}",
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
                                            arguments: favoritData[index]),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "Terjadi kesalahan",
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        }

                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
