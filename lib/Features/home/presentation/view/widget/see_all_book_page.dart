// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/search_bar_home.dart';
import 'package:get/get.dart';

import '../../../../../constant.dart';
import 'second_book_style_list.dart';

class SeeAllPage extends StatelessWidget {
  final String bookCategory;
  final List<BookModel> books;
  const SeeAllPage({
    Key? key,
    required this.bookCategory,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.keyboard_arrow_left_rounded)),
        centerTitle: true,
        title: Text(bookCategory),
        titleTextStyle: appBar20.copyWith(color: Colors.black),
        //toolbarHeight: ,
        
      ),
      body: const Column(
        children: [
          SearchBarHome(),
          SecondBookStyleList()
        ],
      ),
    ));
  }
}
