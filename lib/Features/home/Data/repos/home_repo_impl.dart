import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_3/Core/errors/failure.dart';
import 'package:flutter_application_3/Core/utils/api_serves.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServes apiServes;

  HomeRepoImpl({required this.apiServes});
  @override
  Future<Either<Failure, List<BookModel>>> fetchForYouBooks() async {
    try {
      var data = await apiServes.get(endPoint: 'volumes?q=subject:Computers');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFreeBooks() async{
  try {
    var data =await apiServes.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:fantasy');
    List<BookModel> freeBooks=[];
     for (var item in data['items']) {
        freeBooks.add(BookModel.fromJson(item));
      }
      return right(freeBooks);
  } catch (e) {
    if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
    
  }
  }

