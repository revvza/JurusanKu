import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jurusanku/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void register(String email, String password, String passconfirm) async {
    if (password == passconfirm)
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Get.offAllNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    else {
      print("Password tidak sama");
    }
  }

  void logut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
