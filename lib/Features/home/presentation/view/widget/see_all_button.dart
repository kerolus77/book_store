import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child:  Row(
        children: [
          Text('See All',style: bodyStyle13,),
          const Icon(Icons.arrow_right_rounded,color: Color.fromARGB(255, 157, 155, 155),)
        ],
      ),
    );
  }
}