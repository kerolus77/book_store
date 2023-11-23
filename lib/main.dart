import 'package:book_stor/Core/services/them_services.dart';
import 'package:book_stor/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BookStore());
}


class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeServices().theme,
      home: const SplashView(),
    );
  }
}