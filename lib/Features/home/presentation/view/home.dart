import 'package:flutter/material.dart';

import 'widget/home_view_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: HomeViewBody()
       
        
      ),
    );
  }
}