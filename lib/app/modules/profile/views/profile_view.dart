import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jurusanku/app/contants/my_colors.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.active) {
            var user = snap.data?.data();
            if (user != null) {
              return ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 60,
                        color: MyColors.hovercolor,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user['fullname']?.toString().toUpperCase() ?? ''}",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: MyColors.hovercolor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${user['education']?.toString().toUpperCase() ?? ''}",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: MyColors.hovercolor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${user['email'] ?? ''}",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: MyColors.hovercolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: MyColors.hovercolor, // Warna garis
                    thickness: 1, // Ketebalan garis
                    height: 20, // Tinggi garis
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.UPDATEPROFILE, arguments: user),
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined, color: MyColors.neural70),
                        SizedBox(width: 20),
                        Text(
                          "Update Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: MyColors.neural70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.UPDATEPASSWORD),
                    child: Row(
                      children: [
                        Icon(Icons.password, color: MyColors.neural70),
                        SizedBox(width: 20),
                        Text(
                          "New Password",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: MyColors.neural70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () => authC.logout(),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: MyColors.neural70),
                        SizedBox(width: 20),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: MyColors.neural70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text("Tidak dapat memuat data user"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
