import 'package:flutter/material.dart';

import 'widget/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body:  SignInBody(),
    ));
  }
}