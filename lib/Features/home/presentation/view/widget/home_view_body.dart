import 'package:flutter/material.dart';

import 'category_list.dart';
import 'custom_app_bar.dart';
import 'search_bar_home.dart';
import 'slider_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        SearchBarHome(),
        SliderHome(),
        CategoryList(),
      ],
    );
  }
}
