import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jurusanku/app/routes/app_pages.dart';
import 'package:jurusanku/app/contants/my_colors.dart';

import '../controllers/intoduction_controller.dart';

class IntoductionView extends GetView<IntoductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "JurusanKU",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 31,
                fontWeight: FontWeight.bold,
                color: MyColors.hovercolor,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "Jangan ragu untuk memulai perjalanan \n temukan jurusan impian anda bersama kami.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: MyColors.hovercolor,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 300,
              height: 300,
              child: Image(image: AssetImage("assets/images/ask.png")),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.LOGIN),
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: MyColors.neural10,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(132, 42),
                backgroundColor: MyColors.maincolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
