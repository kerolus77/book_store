import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/book_main_list_view_item.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/category_book_cubit/category_book_cubit.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBookBody extends StatelessWidget {
  const CategoryBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBookCubit, CategoryBookState>(
      builder: (context, state) {
        if(state is CategoryBookSuccess)
        {
          return Expanded(child: GridView.builder(
        itemCount: state.books.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:30,
                      mainAxisSpacing: 20,
                       childAspectRatio: 0.7

                    ), 
                    padding: EdgeInsets.only(left: 25,right: 20),
           itemBuilder:(context, index) {
             
              return Container(
                
                decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 199, 199, 199),width: 2),
                borderRadius: BorderRadius.circular(20),
                color: containerBackground      ),
                child: BookMainListViewItem(book: state.books[index]),
              );
            
           },),
           );} else if(state is CategoryBookFailure){
              return Text(state.errMessage);
             }else{
              return CircularProgressIndicator();
             }
      },
    );
  }
}