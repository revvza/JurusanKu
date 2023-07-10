import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailjurusan_controller.dart';
import 'package:jurusanku/app/contants/my_colors.dart';

class DetailjurusanView extends GetView<DetailjurusanController> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
          '${data['nama']}',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.maincolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(19),
              child: Container(
                padding: EdgeInsets.only(
                    top: 11.5, bottom: 11.5, left: 10, right: 21),
                decoration: BoxDecoration(
                  color: MyColors.border,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: MyColors.hovercolor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${data['nomor']}',
                          style: TextStyle(
                            color: MyColors.hovercolor,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['nama']}',
                            style: TextStyle(
                              color: MyColors.hovercolor,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '${data['kategori']}',
                            style: TextStyle(
                              color: MyColors.hovercolor,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      iconSize: 24.0,
                      color: MyColors.hovercolor,
                      onPressed: () => controller.addFavorit(data),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 19, right: 19, bottom: 19),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: MyColors.hovercolor,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      '${data['deskripsi']}',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      'Pengetahuan dan Keahlian',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      '${data['keahlian']}',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      'Prospek Kerja',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      '${data['kerja']}',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      'Perkuliahan',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      '${data['perkuliahan']}',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      'Kenapa',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 306, height: 10),
                    Text(
                      '${data['alasan']}',
                      style: TextStyle(
                        color: MyColors.neural100,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
