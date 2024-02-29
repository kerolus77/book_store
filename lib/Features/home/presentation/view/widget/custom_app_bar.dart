import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/cart/presentation/view/cart_screen.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/favorite-screen.dart';
import 'package:get/get.dart';

import '../../../../../Core/widget/small_button.dart';
import '../../../../../constant.dart';
import './profile_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ProfileIcon(),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hi, kerolus',
                style: font19w500.copyWith(color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              SmallButton(
                icon: Icons.notifications_outlined,
                onTap: ()async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
              SmallButton(
                icon: Icons.settings_outlined,
                onTap: () {
                  Get.to(()=>FavoriteScreen());
                },
              ),
              SmallButton(
                icon: Icons.download_outlined,
                onTap: () {
                  Get.to(()=>CartScreen());
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
