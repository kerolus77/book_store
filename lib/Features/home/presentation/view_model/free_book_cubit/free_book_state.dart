part of 'free_book_cubit.dart';

abstract class FreeBookState extends Equatable {
  const FreeBookState();

  @override
  List<Object> get props => [];
}

final class FreeBookInitial extends FreeBookState {}
final class FreeBookLoading extends FreeBookState {}

final class FreeBookSuccess extends FreeBookState {
  final List<BookModel> books;

  const FreeBookSuccess({required this.books});


  
}

final class FreeBookFailure extends FreeBookState {
  final String errMessage;

  const FreeBookFailure({required this.errMessage});
}
