part of 'category_book_cubit.dart';

abstract class CategoryBookState extends Equatable {
  const CategoryBookState();

  @override
  List<Object> get props => [];
}

final class CategoryBookInitial extends CategoryBookState {}

final class CategoryBookLoading extends CategoryBookState {}

final class CategoryBookSuccess extends CategoryBookState {
  final List<BookModel> books;

  const CategoryBookSuccess({required this.books});
}

final class CategoryBookFailure extends CategoryBookState {
  final String errMessage;

 const CategoryBookFailure({required this.errMessage});
}