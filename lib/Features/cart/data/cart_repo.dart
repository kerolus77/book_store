import 'package:dartz/dartz.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';


abstract class CartRepo{
  Set<String> cartId=Set();
  List<BookModel> cartBooks=[];
Future<void> addCartItem( BookModel book);
Future<Either<String, List<BookModel>>> getCartItems();
Future<void> removeCartItem(String bookId);
double totalPrise();


}