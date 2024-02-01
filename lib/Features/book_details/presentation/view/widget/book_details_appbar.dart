import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:get/get.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar({super.key});

@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: ()=>Get.back(),
       icon: const Icon(Icons.keyboard_arrow_left_rounded,color: grey,)),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined,color: grey)),
          )
        ],
        
    );
  }
}