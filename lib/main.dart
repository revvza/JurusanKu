import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jurusanku/app/controllers/auth_controller.dart';
import 'package:jurusanku/app/utils/loading.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authC = Get.put(AuthController(), permanent: true);

  runApp(
    StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: LoadingView(),
              ),
            ),
          );
        }
        print(snapshot.data);
        return GetMaterialApp(
          title: "Application",
          initialRoute:
              snapshot.data != null ? Routes.HOME : Routes.INTODUCTION,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
