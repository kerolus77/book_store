part of 'slider_cubit.dart';

abstract class SliderState {}

final class SliderInitial extends SliderState {}

class SliderIncrement extends SliderState {
  final int updatedIndex;

  SliderIncrement(this.updatedIndex);
}
