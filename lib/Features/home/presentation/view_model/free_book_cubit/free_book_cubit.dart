import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo.dart';

import '../../../Data/models/book_model/book_model.dart';

part 'free_book_state.dart';

class FreeBookCubit extends Cubit<FreeBookState> {
  final HomeRepo homeRepo;

  FreeBookCubit(this.homeRepo) : super(FreeBookInitial());

  Future<void> fetchFreeBooks()async{
    emit(FreeBookLoading());
   var result=await homeRepo.fetchFreeBooks();
   result.fold((failure) {
    emit(FreeBookFailure(errMessage:failure.errMessage));
   } , (books) {
    emit(FreeBookSuccess(books: books));
   });

  }
  
}
