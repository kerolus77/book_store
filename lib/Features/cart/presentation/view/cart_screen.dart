import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/widget/app_bar.dart';
import '../../../home/presentation/view/widget/search_bar_home.dart';
import '../view_model/cubit/cart_state.dart';
import 'widget/cart_bottom_app_bar.dart';
import 'widget/cart_list_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  final int total=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(title: 'Cart'),
        
        body: 
         BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
          children: [
            const SearchBarHome(),
           
                state.maybeWhen(
                  loading: () => CircularProgressIndicator(),
                  success: (data,count,total)  {
                    print('test${data.length}');
                    return CartListStyle(books: data);},
                  error:(errMessage) => Text('Error: $errMessage'),
                  orElse: () => Container(),
                  
                )
                
             
          ],
                );}
        ),
        bottomNavigationBar: CartBottomAppBar(total:20 ),
      ),
    );
  }
}


