import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer(
      {super.key,
      this.child,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.backgroundColor = secondaryColor,
      this.margin});

  final double? width;

  final double? height;

  final double radius;

  final double padding;

  final Widget? child;

  final EdgeInsetsGeometry? margin;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
        ), // BoxDecoration

        child: child);
  }
}
