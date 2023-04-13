import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailjurusan_controller.dart';
import 'package:jurusanku/app/contants/my_colors.dart';

class DetailjurusanView extends GetView<DetailjurusanController> {
  @override
  Widget build(BuildContext context) {
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
          'Jurusan 1',
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
                          '1',
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
                            'Jurusan',
                            style: TextStyle(
                              color: MyColors.hovercolor,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Kategori',
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
                    Icon(
                      Icons.favorite_border,
                      color: MyColors.hovercolor,
                      size: 24,
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
                      'Teknik Informatika merupakan bidang ilmu yang mempelajari bagaimana menggunakan teknologi komputer secara optimal guna menangani masalah transformasi atau pengolahan data dengan proses logika. Di Jurusan Teknik Informatika kamu akan mempelajari berbagai prinsip terkait ilmu komputer mulai dari proses perancangan, pengembangan, pengujian, hingga evaluasi sistem operasi perangkat lunak. Selama kuliah kamu akan banyak mengkaji pemrograman dan komputasi, dan dibekali pula dengan keterampilan merancang perangkat lunak.',
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
                      'Kemampuan melakukan analisis, kemampuan berpikir sistematis, kemapuan bekerja secara mandiri maupun tim, keterampilan rekayasa informatika, kemampuan berpikir logis, kemampuan problem solving, kemampuan memahami bahasa pemrograman',
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
                      'Application Engineer, Game Developer, Sofware Engineering, Konsultan IT, Data Scientist, Software Developer,.',
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
                      'Selama 4 tahun atau 8 semester kamu akan dibekali dengan ilmu dan keterampilan untuk pengembangan perangkat lunak.',
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
                      'Perkembangan teknologi yang pesat menjadikan prospek kerja lulusan Teknik Informatika yang semakin luas',
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
