import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import './profile_icon.dart';
import 'app_bar_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
 Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ProfileIcon(),
              const SizedBox(width: 10,),
              Text('Hi, kerolus',style: Themes().subtitleStyle.copyWith(color: Colors.black),),
            ],
          ),
          Row(
            children: [
              AppBarButton(icon: Icons.notifications_outlined, onTap: (){},),
              AppBarButton(icon: Icons.settings_outlined, onTap: (){},),
              AppBarButton(icon: Icons.download_outlined, onTap: (){},)
            ],
          )
        ],
      ),
    );
    
    
  
  }
}



