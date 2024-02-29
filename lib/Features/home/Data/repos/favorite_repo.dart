import 'package:dartz/dartz.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';


abstract class FavoriteRepo{
Future<void> addFavoriteItem( BookModel book);
Future<Either<String, List<BookModel>>> getFavoriteItems();
Future<void> removeFavoriteItem(String bookId);


}