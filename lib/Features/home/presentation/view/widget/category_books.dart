import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/category_cubit/category_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_typr.dart';
import 'main_book_style_list.dart';

class CategoryBooks extends StatelessWidget {
  const CategoryBooks({super.key});

  @override
  Widget build(BuildContext context) {
    if(BlocProvider.of<CategoryListCubit>(context).categoryCurrentIndex==0){
      return SizedBox(
        height: 300,
        child: Column(
          children: [
            BookType(type: 'For You',),
             const MainBookStyleList()
          ],
        ),
      );
    }else
    {
      return Container();
    }
  }
}