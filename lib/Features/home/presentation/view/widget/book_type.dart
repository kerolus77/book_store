// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import 'see_all_button.dart';

class BookType extends StatelessWidget {
  final String type;
  final Function() allPageFun;
  const BookType({
    Key? key,
    required this.type,
    required this.allPageFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: subheadingStyle,
          ),
          SeeAllButton(allPageFun: allPageFun,)
        ],
      ),
    );
  }
}
