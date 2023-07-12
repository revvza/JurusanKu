import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../contants/my_colors.dart';
import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
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
          'FORGOT PASSWORD',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.maincolor,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              'Masukan email yang akan di reset password nya',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: MyColors.neural70,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.hovercolor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autocorrect: false,
                controller: controller.emailC,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: MyColors.neural70,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                ),
              ),
            ),
            SizedBox(height: 15),
            Obx(() => ElevatedButton(
                  onPressed: () {
                    if (controller.isLoading.isFalse) {
                      controller.sendEmail();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(132, 42),
                    backgroundColor: MyColors.maincolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    controller.isLoading.isFalse
                        ? "Send Reset Password"
                        : "Loading...",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: MyColors.neural10,
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
