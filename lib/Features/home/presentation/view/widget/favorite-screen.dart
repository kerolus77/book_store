import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/app_bar.dart';

import 'favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: Appbar(title: 'Favorite'),
      body: FavoriteBody(),
    ));
  }
}