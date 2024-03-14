// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widget/button.dart';
import '../../../../../constant.dart';
import '../../view_model/cubit/cart_state.dart';

class CartBottomAppBar extends StatelessWidget {
  
  final double total;
  const CartBottomAppBar({
    Key? key,
    
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: primaryClr,
      height: 120,
      child: BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    if (state is Success) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${state.count} Books:', style: font17w600),
          SizedBox(height: 10),
          Center(child: Button(label: 'Total ${state.total}\$', onTap: () {}, color: secondaryColor)),
        ],
      );
    } else {
      return Container(); // Handle other states or return an empty container
    }
  },
)
    );
  }
}
