

import 'package:dio/dio.dart';
import 'package:flutter_application_3/Core/utils/api_serves.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<ApiServes>(ApiServes(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiServes: getIt.get<ApiServes>()));

}