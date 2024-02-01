// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';

import '../../../Data/repos/home_repo.dart';

part 'category_book_state.dart';

class CategoryBookCubit extends Cubit<CategoryBookState> {
  final HomeRepo homeRepo;
  CategoryBookCubit(
    this.homeRepo,
  ) : super(CategoryBookInitial());

  Future<void>fetchCategoryBooks(String category)async{
   emit(CategoryBookLoading());
   var result=await homeRepo.fetchCategoryBooks(category);
   result.fold((failure) {
    emit(CategoryBookFailure(errMessage: failure.errMessage));
   } , (books) {
    emit(CategoryBookSuccess(books: books));
   });
  }
}
