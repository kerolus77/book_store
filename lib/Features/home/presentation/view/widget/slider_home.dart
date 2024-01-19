import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/Data/slider/slider_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/assets.dart';
import 'slider_items.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
            items: const [
              SliderItems(
                  image: AssetsData.sliderImage2,
                  label: "Find the book you're looking for easier to read."),
              SliderItems(
                  image: AssetsData.sliderImage1,
                  label: "Find the book you're looking for easier to read."),
              SliderItems(
                  image: AssetsData.sliderImage3,
                  label: "Find the book you're looking for easier to read."),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: ((index, _) =>
                  BlocProvider.of<SliderCubit>(context).incrementSlider(index)),
              autoPlay: true,
            )),
      ],
    );
  }
}
