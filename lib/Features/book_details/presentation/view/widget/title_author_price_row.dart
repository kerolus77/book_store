// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';

import '../../../../../constant.dart';

class TitleAuthorPriceRow extends StatelessWidget {
  final BookModel book;
  const TitleAuthorPriceRow({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(book.volumeInfo.title!, style: font15W700ellipsis.copyWith(overflow: TextOverflow.clip),),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      book.volumeInfo.authors?[0]??'',
                      style: bodyStyle13,
                      maxLines: 1,
                    ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(book.saleInfo?.retailPrice?.amount==null?'Free':'${((book.saleInfo!.retailPrice!.amount)!.ceil())%100}\$',
              style: font19w500.copyWith(color: const Color.fromARGB(255, 34, 98, 36),fontWeight: FontWeight.w700),),
            ),
          )
      ],
    );
  }
}
