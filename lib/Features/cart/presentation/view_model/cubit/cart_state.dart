

import 'package:flutter_application_3/Features/home/Data/models/book_model/book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part  'cart_state.freezed.dart';

@freezed
class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.success(List<BookModel> data,int count,double total) = Success ;
  const factory CartState.error(String errMessage) = Error;
  

}
