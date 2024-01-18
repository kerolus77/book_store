import 'package:bloc/bloc.dart';

part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  CategoryListCubit() : super(CategoryListInitial());

  int categoryCurrentIndex=0;
  void setCategoryIndex(int index){
    categoryCurrentIndex=index;
    emit(CategoryListUpdated(categoryCurrentIndex));
  }
}
