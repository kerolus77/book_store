import 'package:dartz/dartz.dart';
import 'package:flutter_application_3/Core/errors/failure.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchForYouBooks();
  Future<Either<Failure, List<BookModel>>> fetchFreeBooks();
  Future<Either<Failure, List<BookModel>>> fetchCategoryBooks(String category);
}
