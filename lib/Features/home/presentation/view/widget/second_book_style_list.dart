import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/book_second_list_view_item.dart';

class SecondBookStyleList extends StatelessWidget {
  const SecondBookStyleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: BookSecondListViewItem(),
          );
        },
        itemCount: 10,
       
      ), );
  }
}