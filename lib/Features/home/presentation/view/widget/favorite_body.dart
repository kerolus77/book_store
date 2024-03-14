import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view_model/favorite_iteme_cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/favorite_iteme_cubit/favorite_state.dart';
import './search_bar_home.dart';
import 'second_book_style_list.dart';

   
class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().emitGetFavoriteItem();
    return BlocBuilder<FavoriteCubit, FavoriteState>(

      builder: (context, state) {
        
        return Column(
          children: [
            const SearchBarHome(),
            
            state.maybeWhen(
              loading: () => CircularProgressIndicator(),
              success: (data) => SecondBookStyleList(books: data),
              error: (String errMessage) => Text('Error: $errMessage'),
              orElse: () => Container(), )
          ],
        );
      },
    );
  }
}
