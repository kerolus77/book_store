import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:get/get.dart';

import 'widget/book_details_appbar.dart';
import 'widget/book_details_body.dart';

class BookDetailsScreen extends StatelessWidget  {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> arguments=Get.arguments;
    final BookModel book=arguments['book'];
    return  SafeArea(child: Scaffold(
      appBar: const BookDetailsAppBar(),
      body: BookDetailsBody(book: book,),
    ));
  }
}