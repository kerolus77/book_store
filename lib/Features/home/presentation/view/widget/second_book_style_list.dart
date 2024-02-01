// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/book_second_list_view_item.dart';

import '../../../Data/models/book_model/book_model.dart';

class SecondBookStyleList extends StatelessWidget {
  final List<BookModel> books;
  const SecondBookStyleList({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:ListView.builder(
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: BookSecondListViewItem(book:books[index]),
          );
        },
        itemCount: books.length,
       
      ), );
  }
}
