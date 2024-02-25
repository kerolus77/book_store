import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/utils/assets.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widget/sign_in_form.dart';


class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage(AssetsData.authBackground,
              ),fit: BoxFit.fill,
              ),
              ),
              Container(
        color: const Color.fromARGB(88, 255, 255, 255),
      ),
          const SignInForm(),
        ],
      ),
    )
    ;
  }
}

