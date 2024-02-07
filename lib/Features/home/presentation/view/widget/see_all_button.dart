// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class SeeAllButton extends StatelessWidget {
  final Function() allPageFun;
  const SeeAllButton({
    Key? key,
    required this.allPageFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: allPageFun,
      child: Row(
        children: [
          Text(
            'See All',
            style: bodyStyle13,
          ),
          const Icon(
            Icons.arrow_right_rounded,
            color: Color.fromARGB(255, 157, 155, 155),
          )
        ],
      ),
    );
  }
}
