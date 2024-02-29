import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view/widget/see_all_book_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../constant.dart';
import '../../../Data/models/book_model/book_model.dart';
import '../../view_model/for_you_cubit/for_you_book_cubit.dart';
import '../../view_model/free_book_cubit/free_book_cubit.dart';
import 'book_type.dart';
import 'main_book_style_list.dart';
 
class AllBody extends StatelessWidget {
  const AllBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            BlocBuilder<ForYouBookCubit, ForYouBookState>(
              builder: (context, state) {
                if (state is ForYouBookSuccess) {
                  
                  return Column(
                    children: [
                      BookType(
                      type: 'For You',
                      allPageFun: () => Get.to(()=>const SeeAllPage(),arguments: {'bookCategory': 'For You', 'books': state.books}),
  
                      ),
                      MainBookStyleList(books: state.books),
                    ],
                  );
                } else if (state is ForYouBookFailure) {
                  return Text(state.errMessage);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                height: 2,
                color: grey,
              ),
            ),
            
             BlocBuilder<FreeBookCubit, FreeBookState>(
              builder: (context, state) {
                if(state is FreeBookSuccess){
                   return Column(
                     children: [
                      BookType(
              type: 'Free Books',
              allPageFun: () => Get.to(()=>const SeeAllPage(),arguments: {'bookCategory': 'Free You', 'books': state.books}),
            ),
                       MainBookStyleList(books:state.books),
                     ],
                   );
    
                }else if(state is FreeBookFailure){
                  return Text(state.errMessage);
                }else{
                return  const CircularProgressIndicator();
                }
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
