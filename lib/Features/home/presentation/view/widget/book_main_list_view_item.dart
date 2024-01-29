// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/rating_bar.dart';
import 'package:flutter_application_3/constant.dart';

import '../../../Data/models/book_model/book_model.dart';
import 'custom_book_image.dart';

class BookMainListViewItem extends StatelessWidget {
  final BookModel book;
  const BookMainListViewItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBookImage(
                  imageUrl: book.volumeInfo.imageLinks.thumbnail),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(book.volumeInfo.title!, style: bookTitle15, maxLines: 1),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    book.volumeInfo.authors![0],
                    style: bodyStyle13,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  RatingBar(
                      rating: book.volumeInfo.averageRating==null?0:book.volumeInfo.averageRating!,
                      ratingCount: 0,
                      part: false),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
