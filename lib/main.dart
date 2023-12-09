import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Features/splash/presentation/views/splash_view.dart';
import 'constant.dart';

void main() {
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
      primaryColor: primaryClr,
      scaffoldBackgroundColor: primaryClr,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryClr,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      ),
      // Add a comma here
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const SplashView(),
    );
  }
}
