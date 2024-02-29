import 'package:flutter/material.dart';

import '../../../../Core/widget/app_bar.dart';
import '../../../../Core/widget/button.dart';
import '../../../../constant.dart';
import '../../../home/presentation/view/widget/search_bar_home.dart';
import 'widget/cart_list_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(title: 'Cart'),
        body: Column(
          children: [
            const SearchBarHome(),
            CartListStyle(books: []),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: primaryClr,
          height: 120,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text('4 Books:',style: font17w600,),
              SizedBox(height: 10,),
              Center(child: Button(label: 'Total 90\$', onTap: () {}, color: secondaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
