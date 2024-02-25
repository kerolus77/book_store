import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child:  Divider(
            color: Colors.black,
            height: 20,
            endIndent: 20,
            
          
          ),
        ),
        Text('OR',style: font16W600,),
         const Expanded(
          child: Divider(
            color: Colors.black,
            height: 2,
            indent: 20,
            
          
          ),
        )
      ],
    );
  }
}