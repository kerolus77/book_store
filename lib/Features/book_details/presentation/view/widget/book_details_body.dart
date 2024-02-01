// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/constant.dart';

import '../../../../../Core/widget/button.dart';
import 'about_book.dart';
import 'book_details_image.dart';
import 'divider.dart';
import 'rating_button_row.dart';
import 'title_author_price_row.dart';

class BookDetailsBody extends StatelessWidget {
  final BookModel book;
  const BookDetailsBody({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            
            
            children: [
              BookDetailsImage(imageUrl: book.volumeInfo.imageLinks.thumbnail,),
              const SizedBox(height: 20,),
              TitleAuthorPriceRow(book: book,),
              const SizedBox(height: 2,),
              RatingButtonRow(book: book,),
              const SizedBox(height: 10,),
              const DividerDetails(),
              const SizedBox(height: 15,),
              AboutBook(book:book),
              Button(label: 'Buy Now', onTap: (){}, color: secondaryColor)
            ],
          
          ),
        ),
      ),
    );
  }
}


