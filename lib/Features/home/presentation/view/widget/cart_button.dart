// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../cart/presentation/view_model/cubit/cart_cubit.dart';
import '../../../Data/models/book_model/book_model.dart';
import '../../view_model/for_you_cubit/for_you_book_cubit.dart';
import '../../view_model/free_book_cubit/free_book_cubit.dart';

class CartButton extends StatefulWidget {
  final BookModel book;
  const CartButton({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        child: Container(
          width: 33,
          height: 33,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryClr,
              border: Border.all(width: 1, color: const Color.fromARGB(255, 177, 176, 176))),
          child: widget.book.isInCart==1?
          
          Icon(Icons.shopping_cart_rounded,
            size: 25,
            color: secondaryColor,
          )
          :Icon(Icons.shopping_cart_outlined ,
            size: 25,
            
            color: clrIconButton,
          ),
        ),
     onTap: (){setState(() {
          if(widget.book.isInCart==1){
            widget.book.isInCart=0;
            context.read<CartCubit>().emitRemoveCartItem(widget.book.id!);
           fetchAllBook(context);
          }else{
            widget.book.isInCart=1;
            context.read<CartCubit>().emitAddCartItem(widget.book);
            fetchAllBook(context);
            }
        });
          
          },

      ),
    );
  }
  
  void fetchAllBook(BuildContext context) {
    
    context.read<FreeBookCubit>().fetchFreeBooks();
    context.read<ForYouBookCubit>().fetchForYouBooks();
  }
}