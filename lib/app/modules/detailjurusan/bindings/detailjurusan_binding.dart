import 'package:get/get.dart';

import '../controllers/detailjurusan_controller.dart';

class DetailjurusanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailjurusanController>(
      () => DetailjurusanController(),
    );
  }
}
