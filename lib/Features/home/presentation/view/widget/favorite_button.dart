
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/favorite_iteme_cubit/favorite_cubit.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/for_you_cubit/for_you_book_cubit.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/free_book_cubit/free_book_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';


class FavoriteButton extends StatefulWidget {
  final BookModel book;
  const  FavoriteButton({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: (){setState(() {
          if(widget.book.isFavorite==1){
            widget.book.isFavorite=0;
            context.read<FavoriteCubit>().emitRemoveFavoriteItem(widget.book.id!);
            fetchAllBook(context);
          }else{
            widget.book.isFavorite=1;
            context.read<FavoriteCubit>().emitAddFavoriteItem(widget.book);
            fetchAllBook(context);
            }
        });
          
          },
        child: Container(
          
          width: 33,
          height: 33,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryClr,
              border: Border.all(width: 1, color: const Color.fromARGB(255, 177, 176, 176))),
          child:
          
           widget.book.isFavorite==1?
          
          Icon(FontAwesomeIcons.solidHeart ,
            size: 25,
            color: secondaryColor,
          )
          :Icon(FontAwesomeIcons.heart,
            size: 25,
            
            color: clrIconButton,
          ),
        ),
      ),
    );
  }

  void fetchAllBook(BuildContext context) {
    context.read<FavoriteCubit>().emitGetFavoriteItem();
    context.read<FreeBookCubit>().fetchFreeBooks();
    context.read<ForYouBookCubit>().fetchForYouBooks();
  }
}
