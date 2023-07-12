import 'package:get/get.dart';

import 'package:jurusanku/app/modules/detailjurusan/bindings/detailjurusan_binding.dart';
import 'package:jurusanku/app/modules/detailjurusan/views/detailjurusan_view.dart';
import 'package:jurusanku/app/modules/detailkategori/bindings/detailkategori_binding.dart';
import 'package:jurusanku/app/modules/detailkategori/views/detailkategori_view.dart';
import 'package:jurusanku/app/modules/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:jurusanku/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:jurusanku/app/modules/home/bindings/home_binding.dart';
import 'package:jurusanku/app/modules/home/views/home_view.dart';
import 'package:jurusanku/app/modules/intoduction/bindings/intoduction_binding.dart';
import 'package:jurusanku/app/modules/intoduction/views/intoduction_view.dart';
import 'package:jurusanku/app/modules/login/bindings/login_binding.dart';
import 'package:jurusanku/app/modules/login/views/login_view.dart';
import 'package:jurusanku/app/modules/profile/bindings/profile_binding.dart';
import 'package:jurusanku/app/modules/profile/views/profile_view.dart';
import 'package:jurusanku/app/modules/register/bindings/register_binding.dart';
import 'package:jurusanku/app/modules/register/views/register_view.dart';
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
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
  ];
}
