import 'package:flutter/material.dart';

class DividerDetails extends StatelessWidget {
  const DividerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Divider(
        height: 2,
        color: Colors.grey,
      ),
    );
  }
}