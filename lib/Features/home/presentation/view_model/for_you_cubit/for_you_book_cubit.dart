// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/Features/home/Data/repos/favorite_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/Data/repos/favorite_repo.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo.dart';

part 'for_you_book_state.dart';

class ForYouBookCubit extends Cubit<ForYouBookState> {
  ForYouBookCubit(
    this.homeRepo,
    
  ) : super(ForYouBookInitial());
  final HomeRepo homeRepo;
  

  Future<void> fetchForYouBooks() async {
    emit(ForYouBookLoading());
    var result = await homeRepo.fetchForYouBooks();
    result.fold((failure) {
      emit(ForYouBookFailure(errMessage: failure.errMessage));
    }, (books) {

      
      emit(ForYouBookSuccess(books: books));
    });
  }
}
