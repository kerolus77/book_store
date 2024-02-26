import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    required this.title,
  });

  final String title;
@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.keyboard_arrow_left_rounded)),
      centerTitle: true,
      title: Text(title),
      titleTextStyle: appBar20.copyWith(color: Colors.black),
      
      //toolbarHeight: ,
      
    );
  }
}