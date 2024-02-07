import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        child: Container(
          width: 33,
          height: 33,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryClr,
              border: Border.all(width: 1, color: const Color.fromARGB(255, 177, 176, 176))),
          child: const Icon(
            Icons.shopping_cart_outlined,
            size: 27,
            color: clrIconButton,
          ),
        ),
      ),
    );
  }
}