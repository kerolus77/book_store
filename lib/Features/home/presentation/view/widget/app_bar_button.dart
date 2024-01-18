// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class AppBarButton extends StatelessWidget {
   final IconData icon;
  final Function() onTap;
  const AppBarButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        child: Container(
          width: 33,
          height: 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          color: primaryClr,
          border: Border.all(width: 1,color: Colors.grey)
          ),
          child: Icon(icon,size: 30,color:clrIconButton, ),
        ),
      ),
    );
  }
}
