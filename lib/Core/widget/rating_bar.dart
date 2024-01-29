// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final int ratingCount;
  final bool part;
  const RatingBar({
    Key? key,
    required this.rating,
    this.size = 18,
    required this.ratingCount,
    required this.part,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final List<Widget> _starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    createRatingList(realNumber, _starList, partNumber);
    ratingCount != 0
        ? _starList.add(
            Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text('($ratingCount)',
                    style: TextStyle(
                        fontSize: size * 0.8,
                        color: Theme.of(context).disabledColor))),
          )
        : SizedBox();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _starList,
    );
  }

  void createRatingList(
      int realNumber, List<Widget> _starList, int partNumber) {
    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Icon(
            Icons.star_rate,
            size: size,
            color: starColor,
          ),
        ));
      } else if (i == realNumber && part) {
        _starList.add(Padding(
          padding: const EdgeInsets.only(right: 5),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                Icon(
                  Icons.star_rate,
                  size: size,
                  color: starColor,
                ),
                ClipRect(
                  clipper: _Clipper(partNumber),
                  child: Icon(
                    Icons.star_rate,
                    color: const Color.fromARGB(255, 191, 188, 188),
                    size: size,
                  ),
                )
              ],
            ),
          ),
        ));
      } else {
        _starList.add(Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star_border_purple500_outlined,
            size: size,
            color: Colors.grey,
          ),
        ));
      }
    }
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper(this.part);
  @override
  getClip(Size size) {
    return Rect.fromLTRB((size.width / 10) * part, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
