import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    child: const CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(AssetsData.profileIcon),radius: 22,),
        );
  }
}