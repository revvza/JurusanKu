import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../contants/my_colors.dart';
import '../controllers/updatepassword_controller.dart';

class UpdatepasswordView extends GetView<UpdatepasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE PASSWORD',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: MyColors.neural10,
            )),
        centerTitle: true,
        backgroundColor: MyColors.maincolor,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.hovercolor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autocorrect: false,
                controller: controller.currC,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Current Password",
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
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.hovercolor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autocorrect: false,
                controller: controller.newC,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "New Password",
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
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.hovercolor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autocorrect: false,
                controller: controller.confirmC,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirm New Password",
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Obx(
                () => ElevatedButton(
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      controller.updatePass();
                    }
                  },
                  child: Text(
                    controller.isLoading.isFalse
                        ? "Change Password"
                        : "Loading...",
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
