// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_list_cubit.dart';

abstract class CategoryListState {}

final class CategoryListInitial extends CategoryListState {}
class CategoryListUpdated extends CategoryListState {
  final int updatedIndex;

  CategoryListUpdated(
    this.updatedIndex,
  );
}
