

import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  int carouselCurrentIndex = 0;
  void incrementSlider(int index) {
    carouselCurrentIndex = index;
    emit(SliderIncrement(carouselCurrentIndex));
  }
}
