import 'package:get/get.dart';

import 'package:jurusanku/app/modules/detailjurusan/bindings/detailjurusan_binding.dart';
import 'package:jurusanku/app/modules/detailjurusan/views/detailjurusan_view.dart';
import 'package:jurusanku/app/modules/detailkategori/bindings/detailkategori_binding.dart';
import 'package:jurusanku/app/modules/detailkategori/views/detailkategori_view.dart';
import 'package:jurusanku/app/modules/home/bindings/home_binding.dart';
import 'package:jurusanku/app/modules/home/views/home_view.dart';
import 'package:jurusanku/app/modules/intoduction/bindings/intoduction_binding.dart';
import 'package:jurusanku/app/modules/intoduction/views/intoduction_view.dart';
import 'package:jurusanku/app/modules/search/bindings/search_binding.dart';
import 'package:jurusanku/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTODUCTION,
      page: () => IntoductionView(),
      binding: IntoductionBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.DETAILKATEGORI,
      page: () => DetailkategoriView(),
      binding: DetailkategoriBinding(),
    ),
    GetPage(
      name: _Paths.DETAILJURUSAN,
      page: () => DetailjurusanView(),
      binding: DetailjurusanBinding(),
    ),
  ];
}
