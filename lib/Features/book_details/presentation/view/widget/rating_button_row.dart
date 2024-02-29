// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/rating_bar.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Core/widget/small_button.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/favorite_button.dart';

class RatingButtonRow extends StatelessWidget {
  final BookModel book;
  const RatingButtonRow({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar(
                      rating: book.volumeInfo.averageRating==null?0:book.volumeInfo.averageRating!,
                      ratingCount: 0,
                      part: false,size: 27,),
        Row(
          children: [
             FavoriteButton(book: book),
            SmallButton(icon: Icons.download_rounded, onTap: (){}),
            SmallButton(icon: Icons.menu_book_sharp, onTap: (){}),
          ],
        )
      ],
    );
  }
}
