import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/cart/presentation/view/widget/cart_list_view_item.dart';
import 'package:flutter_application_3/Features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../home/presentation/view_model/favorite_iteme_cubit/favorite_cubit.dart';
import '../../../../home/presentation/view_model/for_you_cubit/for_you_book_cubit.dart';
import '../../../../home/presentation/view_model/free_book_cubit/free_book_cubit.dart';

class CartSlidable extends StatelessWidget {
  final BookModel book;
  final int index;
  const CartSlidable({super.key, required this.book, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
    horizontalOffset: 400,
    child: FlipAnimation(
    
    child:Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Positioned.fill(
                child: Builder(
                    builder: (context) => Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: secondaryColor),
                      )),
              ),
              
                   Slidable(
                              key: Key(book.id!),
                              direction: Axis.horizontal,
                              endActionPane: ActionPane(
                                motion: BehindMotion(),
                                
                                 dismissible: DismissiblePane(
                                  onDismissed: () {
    
                                      removeItem(context, index);
    
  },
                                 ),
                                 
                                extentRatio: 0.3,
                                children: [
                                  SlidableAction(
                                    
                                    label: 'Delete',
                                    backgroundColor: const Color.fromARGB(0, 255, 0, 0),
                                    autoClose: true,
                                    
                                    icon: Icons.delete, onPressed: (BuildContext context) {  },
                                    
                                  ),
                                ],
                              ),
                              child:  
                             
            CartListViewItem(book: book, index: index)
         
  
              
     ) 
     ],
          ), 
          ),
          ),
          );
  }

  void removeItem(BuildContext context ,int index) {
    
      context.read<CartCubit>().emitRemoveCartItem(book.id!);
      fetchAllBook(context);
      
    
  }
   void fetchAllBook(BuildContext context) {
    context.read<FavoriteCubit>().emitGetFavoriteItem();
    context.read<FreeBookCubit>().fetchFreeBooks();
    context.read<ForYouBookCubit>().fetchForYouBooks();
  }
}