
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Features/cart/data/cart_repo_impl.dart';

import '../models/book_model/book_model.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo{
  Set<String> favoriteId=Set();
  final CartRepoImpl cartRepoImpl;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userId = FirebaseAuth.instance.currentUser!.uid;

  FavoriteRepoImpl(this.cartRepoImpl);

  @override
  Future<void> addFavoriteItem( BookModel book)async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('favorite_items')
        .doc(book.id)
        .set(book.toJson());
        favoriteId.add(book.id!);
  }

  @override
  Future<Either<String, List<BookModel>>> getFavoriteItems() async{
    try {
    var querySnapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('favorite_items')
        .get();
       final result=querySnapshot.docs
        .map((doc) {
          final bookModel = BookModel.fromJson(doc.data() as Map<String, dynamic>);
          // Save the book ID to the set
          favoriteId.add(bookModel.id!);
          cartRepoImpl.cartId.contains((bookModel.id))?bookModel.isInCart=1:bookModel.isInCart=0;
          
          return bookModel;
        })
        .toList();
       
    return right(result);
  } catch (e) {
    print("Error getting favorite items: $e");
    return left(e.toString());
  }
  }

  @override
  Future<void> removeFavoriteItem( String bookId) async{
    try {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('favorite_items')
        .doc(bookId)
        .delete();
        favoriteId.removeWhere((element) => element.contains(bookId));
  } catch (e) {
    print("Error removing favorite item: $e");
  }
  }



}
