import 'package:get/get.dart';

import '../controllers/detailkategori_controller.dart';

class DetailkategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailkategoriController>(
      () => DetailkategoriController(),
    );
  }
}
