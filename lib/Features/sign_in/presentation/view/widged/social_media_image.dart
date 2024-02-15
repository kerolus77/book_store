// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SocialMediaImage extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  const SocialMediaImage({
    Key? key,
    required this.icon,
    required this.color,
    this.size=30
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        
      ),
      child: Icon(icon,color: color,size: size,),
    );
  }
}
