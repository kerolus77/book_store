import 'package:flutter/material.dart';

import '../../../Data/models/book_model/book_model.dart';
import 'book_main_list_view_item.dart';

class MainBookStyleList extends StatelessWidget {
  final List<BookModel> books;

  const MainBookStyleList({super.key, required this.books});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: BookMainListViewItem(book: books[index]),
          );
        },
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
