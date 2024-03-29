// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_application_3/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/slider_cubit/slider_cubit.dart';
import 't_circular_container.dart';

class SliderItems extends StatelessWidget {
  final String image;
  final String label;
  const SliderItems({Key? key, required this.image, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: SizeConfig.screenWidth,

        // margin:const EdgeInsets.only(left: 20,right: 20) ,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AspectRatio(
              aspectRatio: 4.9 / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(fit: BoxFit.fill, image: AssetImage(image)),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 6.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(96, 190, 219, 236),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: Text(
                label,
                style: bodyStyle,
              ),
            ),
            BlocBuilder<SliderCubit, SliderState>(
              builder: (context, state) {
                return Positioned(
                  bottom: 10,
                  left: SizeConfig.screenWidth / 2.5,
                  child: Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        TCircularContainer(
                          width: 11,
                          height: 4,
                          margin: const EdgeInsets.only(right: 5),
                          radius: 0,
                          backgroundColor: BlocProvider.of<SliderCubit>(context)
                                      .carouselCurrentIndex ==
                                  i
                              ? secondaryColor
                              : grey,
                        )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
