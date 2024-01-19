import 'package:flutter/material.dart';

import 'widged/page_view_body.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: PageViewBody(),
      ),
    );
  }
}
