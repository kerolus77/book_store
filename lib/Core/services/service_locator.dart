import 'package:dio/dio.dart';
import 'package:flutter_application_3/Core/utils/api_serves.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo_impl.dart';
import 'package:flutter_application_3/Features/sign_in/data/repo/sign_in_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../Features/sign_up/data/repo/sign_up_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServes>(ApiServes(getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServes: getIt.get<ApiServes>()));

//SignIn

getIt.registerSingleton<SignInRepoImpl>(SignInRepoImpl());

//signUp
getIt.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl());

}
