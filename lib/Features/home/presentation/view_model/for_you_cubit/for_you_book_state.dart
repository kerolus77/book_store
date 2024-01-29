part of 'for_you_book_cubit.dart';

abstract class ForYouBookState extends Equatable {
  const ForYouBookState();

  @override
  List<Object> get props => [];
}

final class ForYouBookInitial extends ForYouBookState {}

final class ForYouBookLoading extends ForYouBookState {}

final class ForYouBookSuccess extends ForYouBookState {
  final List<BookModel> books;

  const ForYouBookSuccess({required this.books});
}

final class ForYouBookFailure extends ForYouBookState {
  final String errMessage;

  const ForYouBookFailure({required this.errMessage});
}
