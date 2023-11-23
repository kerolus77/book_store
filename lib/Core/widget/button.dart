import 'package:book_stor/constant.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function() onTap;
  final  Color color;
  const Button({
    Key? key,
    required this.label,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width-50,
          height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
        color: color,
        border: Border.all(width: 1,color: Colors.grey)
        ),
        child: Text(label,style: Themes().buttonTitleStyle.copyWith(color: color==primaryClr?Colors.black:Colors.white),),
      ),
    );
  }
}