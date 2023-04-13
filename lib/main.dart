import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jurusanku/app/modules/detailjurusan/views/detailjurusan_view.dart';
import 'package:jurusanku/app/modules/detailkategori/views/detailkategori_view.dart';
import 'package:jurusanku/app/modules/home/views/home_view.dart';
import 'package:jurusanku/app/modules/search/views/search_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.INTODUCTION,
      getPages: AppPages.routes,
      routes: {
        '/': (context) => HomeView(),
        '/search': (context) => SearchView(),
        '/detailkategori': (context) => DetailkategoriView(),
        '/detailjurusan': (context) => DetailjurusanView(),
      },
    ),
  );
}
