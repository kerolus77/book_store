import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';

part 'for_you_book_state.dart';

class ForYouBookCubit extends Cubit<ForYouBookState> {
  ForYouBookCubit() : super(ForYouBookInitial());
}
