// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_application_3/Features/cart/data/cart_repo.dart';

import '../../../../home/Data/models/book_model/book_model.dart';
import './cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(
    this.cartRepo,
  ) : super(CartState.initial());
  
  
 int count=5;
void emitAddCartItem(BookModel book)async{
   await  cartRepo.addCartItem(book);
   count=cartRepo.cartBooks.length;
   double total=cartRepo.totalPrise();
   emit(CartState.success(cartRepo.cartBooks,count,total));
   
}
void emitRemoveCartItem(String bookId)async{
  print(cartRepo.cartBooks.length);
 await cartRepo.removeCartItem(bookId);
 
    count=cartRepo.cartBooks.length;
    double total=cartRepo.totalPrise();
    emit(CartState.success(cartRepo.cartBooks,count,total));
 

 
 
}

void emitGetCartItem()async{
  emit(CartState.loading());
  final response= await cartRepo.getCartItems();
  
  response.fold((failure) {
    emit(CartState.error(failure));
  } , (success) {
    count=success.length;
    double total=cartRepo.totalPrise();
    emit(CartState.success(success,count,total));
  });



}
}
