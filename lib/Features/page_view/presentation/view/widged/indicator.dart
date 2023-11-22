import 'package:book_stor/constant.dart';
import 'package:flutter/material.dart';



 List<Padding> indicator(int index,int lenth) {
    return List.generate(lenth, (dot) =>  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        child: CircleAvatar(
          radius: 9,
          backgroundColor: index==dot?secondaryColor:indicatorColor,
        ),
      )
      
      
      ));
  }

