// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constant.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final double? height;
  final double? width;
  final EdgeInsets? iconPadding;
  final double? size;
  const SmallButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.height,
    this.width,
    this.iconPadding,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width:width?? 33,
          height:height?? 33,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryClr,
              border: Border.all(width: 1, color: Colors.grey)),
          child: Padding(
            padding: iconPadding?? EdgeInsets.all(0),
            child: Icon(
              icon,
              
              size:size?? 27,
              color: clrIconButton,
            ),
          ),
        ),
      ),
    );
  }
}
