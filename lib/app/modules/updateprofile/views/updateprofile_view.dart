import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../contants/my_colors.dart';
import '../controllers/updateprofile_controller.dart';

class UpdateprofileView extends GetView<UpdateprofileController> {
  final Map<String, dynamic> user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.emailC.text = user["email"];
    controller.fullnameC.text = user["fullname"];
    controller.educationC.text = user["education"];
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE',
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
                readOnly: true,
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
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.hovercolor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autocorrect: false,
                controller: controller.fullnameC,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nama Lengkap",
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
                controller: controller.educationC,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "SD/SMP/SMA/SMK",
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
                      await controller.updateProfile(user["uid"]);
                    }
                  },
                  child: Text(
                    controller.isLoading.isFalse
                        ? "Update Profile"
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
