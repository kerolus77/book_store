// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_3/Core/errors/failure.dart';
import 'package:flutter_application_3/Core/utils/api_serves.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/Data/repos/favorite_repo_impl.dart';
import 'package:flutter_application_3/Features/home/Data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServes apiServes;
 final FavoriteRepoImpl favoriteRepoImpl;
  HomeRepoImpl({
    required this.apiServes,
    required this.favoriteRepoImpl,
  });
  @override
  Future<Either<Failure, List<BookModel>>> fetchForYouBooks() async {
    try {
      var data = await apiServes.get(endPoint: 'volumes?q=subject:Computers');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
        favoriteRepoImpl.favoriteList.contains(books[books.length-1].id)?books[books.length-1].isFavorite=1:null;
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
    print(favoriteRepoImpl.favoriteList.length);
     for (var item in data['items']) {
        freeBooks.add(BookModel.fromJson(item));
      favoriteRepoImpl.favoriteList.contains(freeBooks[freeBooks.length-1].id)?freeBooks[freeBooks.length-1].isFavorite=1:null;
      }

      return right(freeBooks);
  } catch (e) {
    if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
    
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchCategoryBooks(String category)async {
    try {
      var data=await apiServes.get(endPoint: 'volumes?q=supject:$category');
      List<BookModel> categoryBooks=[];
      for ( var item in data['items'] ){
      categoryBooks.add(BookModel.fromJson(item));
      favoriteRepoImpl.favoriteList.contains(categoryBooks[categoryBooks.length-1].id)?categoryBooks[categoryBooks.length-1].isFavorite=1:null;
      }
      return right(categoryBooks);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
    }else{
      return left(ServerFailure(errMessage: e.toString()));
    }
    }
  }
  
  @override
  Future<void> fetchAllBook() async {
    await fetchForYouBooks();
    await fetchFreeBooks();
    // await fetchCategoryBooks();
  }
  }

