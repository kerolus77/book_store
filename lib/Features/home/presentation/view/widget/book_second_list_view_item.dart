import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/rating_bar.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/cart_button.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/custom_book_image.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/favorite_button.dart';
import 'package:flutter_application_3/size_config.dart';

import '../../../../../constant.dart';

class BookSecondListViewItem extends StatelessWidget {
  const 
  BookSecondListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: SizeConfig.screenHeight/5,
     
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        
      ),
      child:  Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const SizedBox(
          width: 95,
          child: CustomBookImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnh9dCYH4Cm5c6NYGSo93pvY6IDLGNJ7tfDw&usqp=CAU"),
          ),
          const SizedBox(width: 20,),
          SizedBox(
            width: SizeConfig.screenWidth/2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('book.volumeInfo.title!', style: bookTitle15, maxLines: 1),
                const SizedBox(height: 5,),
                Text(
                      'book.volumeInfo.authors![0]',
                      style: bodyStyle13,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5,),
                    const RatingBar(rating: 4.6, ratingCount: 0, part: false,size: 25,),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const FavoriteButton(),
                        CartButton()
                      ],
                    )
              ],
            ),
          ),
          const SizedBox(width: 20,),
           Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('20\$',style: subheadingStyle.copyWith(color: Color.fromARGB(255, 34, 98, 36)),),
            ),
          )
          

      ],
      ),
    );
  }
}