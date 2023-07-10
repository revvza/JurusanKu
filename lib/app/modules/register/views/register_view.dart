import 'package:flutter/material.dart';
import 'package:jurusanku/app/contants/my_colors.dart';
import 'package:get/get.dart';
import 'package:jurusanku/app/controllers/auth_controller.dart';
import '../controllers/register_controller.dart';
import 'package:jurusanku/app/routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
  final fullnameC = TextEditingController();
  final educationC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final passconfirmC = TextEditingController();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 24.0,
          color: MyColors.hovercolor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'SIGN UP',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: MyColors.hovercolor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Lengkap",
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
                        border:
                            Border.all(color: MyColors.hovercolor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: fullnameC,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Revi Firzatulloh",
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: MyColors.neural70,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Pendidikan",
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
                        border:
                            Border.all(color: MyColors.hovercolor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: educationC,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "SD/SMP/SMA/SMK/KULIAH",
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: MyColors.neural70,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
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
                        border:
                            Border.all(color: MyColors.hovercolor, width: 1),
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
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
                        border:
                            Border.all(color: MyColors.hovercolor, width: 1),
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Password Confirm",
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
                        border:
                            Border.all(color: MyColors.hovercolor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: passconfirmC,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password Confirm",
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: MyColors.neural70,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 54),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => authC.register(
                          fullnameC.text,
                          educationC.text,
                          emailC.text,
                          passC.text,
                          passconfirmC.text,
                        ),
                        child: Text(
                          "Register",
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
                          "Anda sudah memiliki akun?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: MyColors.neural100,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            "Login",
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
                    SizedBox(height: 300),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
