import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/category_list_cubit/category_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './all_body.dart';
import 'category_book_body.dart';


class CategoryBooks extends StatelessWidget {
  const CategoryBooks({super.key});

  @override
  Widget build(BuildContext context) {
return
    BlocBuilder<CategoryListCubit,CategoryListState>(
      builder: (context, state) {
        if (BlocProvider.of<CategoryListCubit>(context).categoryCurrentIndex == 0) {
      return const AllBody();
      }else {
      return const CategoryBookBody();
    }
      },
    );
    
    }
  }


