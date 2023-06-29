import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jurusanku/app/contants/my_colors.dart';

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
          Expanded(
            child: Container(
              // height: 40,
              padding: EdgeInsets.all(16),
              child: TextField(
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
        ],
      ),
    );
  }
}
