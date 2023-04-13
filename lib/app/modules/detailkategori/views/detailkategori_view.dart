import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailkategori_controller.dart';
import 'package:jurusanku/app/contants/my_colors.dart';

class DetailkategoriView extends GetView<DetailkategoriController> {
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
          'Kategori 1',
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
              ListView.builder(
                itemCount: 10,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jurusan ${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: MyColors.hovercolor,
                              ),
                            ),
                            Text(
                              'Kategori 1',
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/detailjurusan');
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
