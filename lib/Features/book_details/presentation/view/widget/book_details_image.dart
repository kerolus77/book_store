// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/size_config.dart';

class BookDetailsImage extends StatelessWidget {
  final String imageUrl;
  const BookDetailsImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: const Color.fromARGB(255, 154, 156, 154),
                        width: 2)),
                height: SizeConfig.screenHeight/2.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
        ),
      ),
    );
  }
}
