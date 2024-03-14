
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Features/cart/data/cart_repo.dart';

import '../../home/Data/models/book_model/book_model.dart';


class CartRepoImpl extends CartRepo{
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userId = FirebaseAuth.instance.currentUser!.uid;
  

  @override
  Future<void> addCartItem( BookModel book)async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('cart_items')
        .doc(book.id)
        .set(book.toJson());
        cartId.add(book.id!);
        cartBooks.add(book);
  }

  @override
  Future<Either<String, List<BookModel>>> getCartItems() async{
    try {
      cartBooks.clear();
    var querySnapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('cart_items')
        .get();

       final result=querySnapshot.docs
        .map((doc) {
          final bookModel = BookModel.fromJson(doc.data() as Map<String, dynamic>);
          // Save the book ID to the set
          cartBooks.add(bookModel);
          cartId.add(bookModel.id!);
          
          // return cartBooks;
        })
        .toList();
       
    return right(cartBooks);
  } catch (e) {
    print("Error getting favorite items: $e");
    return left(e.toString());
  }
  }

  @override
  Future<void> removeCartItem( String bookId) async{
    try {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('cart_items')
        .doc(bookId)
        .delete();
        cartId.removeWhere((element) => element.contains(bookId));
        cartBooks.removeWhere((element) => element.id==bookId);
  } catch (e) {
    print("Error removing cart item: $e");
  }
  }

double totalPrise(){
  double total=0;
  for (var book in cartBooks) {
    if(book.saleInfo?.retailPrice?.amount!=null){
      total+=((book.saleInfo!.retailPrice!.amount)!.ceil())%100;
    }
    
  }
  return total;
}

}
