import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage(AssetsData.authBackground,
              ),fit: BoxFit.fill,
              ),
              ),
              Container(
        color: Color.fromARGB(88, 255, 255, 255),
      ),
          const SignUpForm(),
        ],
      ),
    )
    );
  }
}