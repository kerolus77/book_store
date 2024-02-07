import 'package:flutter/material.dart';

import 'widged/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignInBody(),
    ));
  }
}