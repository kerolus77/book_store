// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/rating_bar.dart';
import 'package:flutter_application_3/Core/widget/small_button.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/custom_book_image.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/favorite_button.dart';
import 'package:flutter_application_3/size_config.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../constant.dart';
import '../../../../book_details/presentation/view/book_details_screen.dart';

class CartListViewItem extends StatelessWidget {
  final BookModel book;
  final int index;
  const CartListViewItem({
    Key? key,
    required this.book,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Get.to(()=>const BookDetailsScreen(),arguments: {'book':book});
      },
      child: Container(
        
        height: SizeConfig.screenHeight/5,
       
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: containerBackground,
        ),
        child:  Row(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
            width: 95,
            height: 125,
            child: CustomBookImage(imageUrl: book.volumeInfo.imageLinks.thumbnail),
            ),
            const SizedBox(width: 25,),
            SizedBox(
              width: SizeConfig.screenWidth/2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Text(book.volumeInfo.title!, style: font15W700ellipsis, maxLines: 1),
                  const SizedBox(height: 5,),
                  Text(
                        book.volumeInfo.authors![0],
                        style: bodyStyle13,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5,),
                       RatingBar(rating:book.volumeInfo.averageRating==null?0:book.volumeInfo.averageRating!
                       , ratingCount: 0, part: false,size: 25,),
                      const SizedBox(height: 15,),
                       Row(
                        
                        children: [
                          SmallButton(icon: FontAwesomeIcons.minus, onTap: (){},size: 20,height: 30,width: 30,),
                          const SizedBox(width: 15,),
                          Text('1',style: font17w600,),
                          const SizedBox(width: 5,),
                          SmallButton(icon: Icons.add, onTap: (){},height: 30,width: 30,),

                        ],
                      )
                ],
              ),
            ),
            const SizedBox(width: 20,),
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                FavoriteButton(book: book),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(book.saleInfo?.retailPrice?.amount==null?'Free':'${((book.saleInfo!.retailPrice!.amount)!.ceil())%100}\$',style: font16W600.copyWith(color: const Color.fromARGB(255, 34, 98, 36)),),
                  ),
                    ),
                    
               ],
             )
            
      
        ],
        ),
      ),
    );
  }
}
