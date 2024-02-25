

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../Core/widget/button.dart';
import '../../../../../constant.dart';
import '../../../../reset_password/presentation/view/reset_password.dart';
import '../../../../sign_up/presentation/view/sign_up_screen.dart';
import '../../view_model/cubit/sign_in_cubit.dart';
import './email_and_password.dart';
import './sign_in_block_listener.dart';
import 'or_divider.dart';
import 'social_media_image.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 10,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back',style: font24W600,),
            Text('Sign in',style: font35W700,),
            const SizedBox(height:25 ,),
            Column(
              children: [
                const EmailAndPassword(),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(child: Text('Forgot password !',style:font15W700ellipsis,),
              onTap: () => Get.to(()=>ResetPassword()),),
              
            ),
            const SizedBox(height: 20,),
            Button(label: 'Sign in', onTap: (){

              validateThenDoLogin(context);
              
            }, color: secondaryColor),
            const SizedBox(height: 20,),
            const OrDivider(),
            const SizedBox(height: 25,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaImage(icon: FontAwesomeIcons.facebook,color: const Color.fromARGB(255, 59, 93, 230),
                onTap: () => context.read<SignInCubit>().emitSignInWithFacebookState(),),
                const SizedBox(width: 30,),
                SocialMediaImage(icon: FontAwesomeIcons.twitter,color: const Color.fromARGB(255, 61, 200, 255),
                onTap: ()=> context.read<SignInCubit>().emitSignInWithTwitterState()),
                const SizedBox(width: 30,),
                SocialMediaImage(icon: FontAwesomeIcons.google,color: const Color.fromARGB(255, 233, 30, 30),
                onTap:  () => context.read<SignInCubit>().emitSignInWithGoogleState(),),
              ],
            ),
            const SizedBox(height: 30,),
          RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyle(color: Color.fromARGB(251, 69, 67, 67), fontSize: 15, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'Sign up',
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.offAll(() => const SignUpScreen());
              },
          ),
        ],
      ),
    ),
    const SignInBlockListener(),
            
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
  if(context.read<SignInCubit>().signInFormKey.currentState!.validate()){
    context.read<SignInCubit>().emitSignInState(); 
  }
}
}

