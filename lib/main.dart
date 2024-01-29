import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/services/service_locator.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo_impl.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/for_you_cubit/for_you_book_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'Features/home/presentation/view_model/category_cubit/category_list_cubit.dart';
import 'Features/home/presentation/view_model/free_book_cubit/free_book_cubit.dart';
import 'Features/home/presentation/view_model/slider_cubit/slider_cubit.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'constant.dart';

void main() {
  setup();
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SliderCubit()),
        BlocProvider(create: (context) => CategoryListCubit()),
        BlocProvider(
          create: (context) =>
              ForYouBookCubit(getIt.get<HomeRepoImpl>())..fetchForYouBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FreeBookCubit(getIt.get<HomeRepoImpl>())..fetchFreeBooks(),
        )
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
