import 'package:flutter/material.dart';

import 'widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      //resizeToAvoidBottomInset: false,
      body:  SignUpBody(),
    )); 
  }
}