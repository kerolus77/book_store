
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../size_config.dart';

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
          width:SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth/2:
           MediaQuery.of(context).size.width-50,
          height:SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight/8:
           MediaQuery.of(context).size.width/8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
        color: color,
        border: Border.all(width: 1,color: Colors.grey)
        ),
        child: Text(label,style: Themes().buttonTitleStyle.copyWith(color: color==primaryClr?Colors.black:Colors.white),),
      ),
    );
  }
}