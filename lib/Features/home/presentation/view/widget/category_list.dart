import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/category_cubit/category_list_cubit.dart';

List<String> categories = ['All', 'Art', 'Psychology', 'Fantasy', 'Romance'];

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Set the desired height for your row
      child: BlocBuilder<CategoryListCubit, CategoryListState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<CategoryListCubit>(context)
                        .setCategoryIndex(index);
                    print('Tapped on ${categories[index]}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      // Optional: Add border
                      border: BlocProvider.of<CategoryListCubit>(context)
                                  .categoryCurrentIndex ==
                              index
                          ? const Border(
                              bottom: BorderSide(color: Colors.black, width: 2))
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: subheadingStyle.copyWith(
                            color: BlocProvider.of<CategoryListCubit>(context)
                                        .categoryCurrentIndex ==
                                    index
                                ? Colors.black
                                : Colors.grey),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
