import 'package:bloc/bloc.dart';
import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter_application_3/Features/home/Data/repos/favorite_repo.dart';

import './favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {

  final FavoriteRepo favoriteRepo;
  FavoriteCubit(this.favoriteRepo) : super(FavoriteState.initial());

void emitAddFavoriteItem(BookModel book)async{
   await  favoriteRepo.addFavoriteItem(book);
   await favoriteRepo.getFavoriteItems();
}
void emitRemoveFavoriteItem(String bookId)async{
 await favoriteRepo.removeFavoriteItem(bookId);
 await favoriteRepo.getFavoriteItems();
}

void emitGetFavoriteItem()async{
  emit(FavoriteState.loading());
  final response= await favoriteRepo.getFavoriteItems();
  
  response.fold((failure) {
    emit(FavoriteState.error(failure));
  } , (success) {
     
    emit(FavoriteState.success(success));
  });

}
  
}
