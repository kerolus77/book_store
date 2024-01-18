
import 'package:flutter_application_3/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/page_view/presentation/view/page_view.dart';

abstract class AppRoutes{
  static final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
     GoRoute(
      path: '/pageView',
      builder: (context, state) => const PageViews(),
    ),
  ],
);
}