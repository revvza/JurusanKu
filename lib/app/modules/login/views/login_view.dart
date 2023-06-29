import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jurusanku/app/controllers/auth_controller.dart';

import '../controllers/login_controller.dart';

import 'package:jurusanku/app/contants/my_colors.dart';

import 'package:jurusanku/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  color: MyColors.hovercolor,
                ),
              ),
              SizedBox(height: 11),
              Text(
                "Hallo! Untuk memulai, mohon daftar terlebih dahulu jika Anda belum memiliki akun. Jika sudah punya, silakan masuk dengan email dan password yang telah Anda buat sebelumnya.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: MyColors.neural100,
                ),
              ),
              SizedBox(height: 64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
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
                      controller: emailC,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "revif25@gmail.com",
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
                  Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
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
                      controller: passC,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          color: MyColors.neural70,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.HOME),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: MyColors.hovercolor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 64),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => authC.login(emailC.text, passC.text),
                      child: Text(
                        "Login",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Anda tidak memiliki akun?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: MyColors.neural100,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          " Daftar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: MyColors.hovercolor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
