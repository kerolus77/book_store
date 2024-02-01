// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_application_3/size_config.dart';

class AboutBook extends StatelessWidget {
  final BookModel book;
  const AboutBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        foregroundDecoration:const BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              primaryClr,
              primaryClrWithOps
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center
            )
        ) ,
        height:book.volumeInfo.description ==null? 100:SizeConfig.screenHeight/4.7,
        child: SingleChildScrollView(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('About Book',style:bookTitle15 ,),
                  const SizedBox(height: 5,),
                  Text(book.volumeInfo.description ==null?' ':book.volumeInfo.description!)
                  
                ],
              ),
        ),
      ),
    );
  }
}
