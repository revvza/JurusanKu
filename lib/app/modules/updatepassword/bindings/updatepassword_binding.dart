import 'package:get/get.dart';

import '../controllers/updatepassword_controller.dart';

class UpdatepasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatepasswordController>(
      () => UpdatepasswordController(),
    );
  }
}
