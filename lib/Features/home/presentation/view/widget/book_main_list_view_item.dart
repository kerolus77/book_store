import 'package:flutter/material.dart';

import 'custom_book_image.dart';



class BookMainListViewItem extends StatelessWidget {
  const BookMainListViewItem({super.key});

 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
       width: 120,
       
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
              height: 110,
               child: const CustomBookImage(
                      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTaUI9ahBe70bYKxAWsbCMD8dXFlewf6hJzGhigcMsZhdx6ZL9b_RXBvfCM0-hWWFGS90&usqp=CAU'),
             ),
                const Expanded(child: Column(children: [
                 Text('Book Title'),
                Text('Author Name')
                
                ],))
                
            ],
          ),
        ),
      ),
    );
  }
}