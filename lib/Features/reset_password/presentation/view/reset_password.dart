import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/app_bar.dart';

import 'widget/reset_password_body.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Appbar(title: 'Forgot Password'),
      body: ResetPasswordBody(),
    ));
  }
}