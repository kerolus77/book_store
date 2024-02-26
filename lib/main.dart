import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/services/service_locator.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo_impl.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/category_book_cubit/category_book_cubit.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/for_you_cubit/for_you_book_cubit.dart';
import 'package:flutter_application_3/Features/reset_password/data/repos/reset_password_repo_impl.dart';
import 'package:flutter_application_3/Features/reset_password/presentation/view_models/cubit/reset_password_cubit.dart';
import 'package:flutter_application_3/Features/sign_in/data/repo/sign_in_repo_impl.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'Features/home/presentation/view_model/category_list_cubit/category_list_cubit.dart';
import 'Features/home/presentation/view_model/free_book_cubit/free_book_cubit.dart';
import 'Features/home/presentation/view_model/slider_cubit/slider_cubit.dart';
import 'Features/sign_up/data/repo/sign_up_repo_impl.dart';
import 'Features/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: const FirebaseOptions(apiKey:'AIzaSyDEu5ZTDZvyfyLINor4Wm5JpdNZa2L8yQU',
   appId:'1:733661797644:android:4f8d72ec1040df9878bd29',
   messagingSenderId:'733661797644',
   projectId:'book-store-b901b')
  );

  
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
        ),
        BlocProvider(
          create: (context) =>
              CategoryBookCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              SignInCubit(getIt.get<SignInRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              SignUpCubit(getIt.get<SignUpRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              ResetPasswordCubit(getIt.get<ResetPasswordRepoImpl>()),
        ),
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
