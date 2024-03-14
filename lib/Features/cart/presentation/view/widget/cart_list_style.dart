// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/cart/presentation/view/widget/cart_slidable.dart';

import '../../../../home/Data/models/book_model/book_model.dart';


class CartListStyle extends StatelessWidget {
  final List<BookModel> books;
  const CartListStyle({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: CartSlidable(book:books[index],index: index,),
            );
          },
          itemCount: books.length,
         
        ),
       );
  } 
}
