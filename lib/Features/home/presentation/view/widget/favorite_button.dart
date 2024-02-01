import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        child: Container(
          width: 33,
          height: 33,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryClr,
              border: Border.all(width: 1, color: const Color.fromARGB(255, 177, 176, 176))),
          child: const Icon(FontAwesomeIcons.heart,
            size: 25,
            color: clrIconButton,
          ),
        ),
      ),
    );
  }
}