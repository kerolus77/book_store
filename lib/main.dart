import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/slider/slider_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'Features/home/Data/category_cubit/category_list_cubit.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'constant.dart';

void main() {
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SliderCubit()),
        BlocProvider(create: (context) => CategoryListCubit())
      ],
      child: GetMaterialApp(
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
      ),
    );
  }
}
