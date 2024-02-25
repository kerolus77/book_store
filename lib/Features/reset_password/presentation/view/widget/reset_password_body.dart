import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/utils/assets.dart';

import 'reset_password_form.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsData.authBackground),
          fit: BoxFit.fill,
        ),
      ),
        ),
            Container(
      color: const Color.fromARGB(88, 255, 255, 255),
    ),
       const ResetPasswordForm(),
        
      ],
    );
  }
}