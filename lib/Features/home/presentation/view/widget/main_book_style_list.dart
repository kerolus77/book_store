import 'package:flutter/material.dart';

import 'book_main_list_view_item.dart';

class MainBookStyleList extends StatelessWidget {
  const MainBookStyleList({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
        height: 240,
        width: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return  const Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child:
                   BookMainListViewItem(),
                );
        },
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        ),
      )
    ;
  }
}