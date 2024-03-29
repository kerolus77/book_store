import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/assets.dart';
import '../../view_model/slider_cubit/slider_cubit.dart';
import 'slider_items.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Stack(
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
                height: 150,
                viewportFraction: 1,
                onPageChanged: ((index, _) =>
                    BlocProvider.of<SliderCubit>(context)
                        .incrementSlider(index)),
                autoPlay: true,
              )),
        ],
      ),
    );
  }
}
