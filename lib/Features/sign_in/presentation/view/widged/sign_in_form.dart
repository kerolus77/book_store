import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/button.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widged/email_and_password.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widged/sign_in_block_listener.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widged/social_media_image.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';
import 'or_divider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  
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
                EmailAndPassword(),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerRight,
              child: Text('Forgot password !',style:font15W700,),
              
            ),
            const SizedBox(height: 20,),
            Button(label: 'Sign in', onTap: (){

              validateThenDoLogin(context);
              
            }, color: secondaryColor),
            const SizedBox(height: 20,),
            const OrDivider(),
            const SizedBox(height: 25,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaImage(icon: FontAwesomeIcons.facebook,color: Color.fromARGB(255, 59, 93, 230)),
                SizedBox(width: 30,),
                SocialMediaImage(icon: FontAwesomeIcons.twitter,color: Color.fromARGB(255, 61, 200, 255)),
                SizedBox(width: 30,),
                SocialMediaImage(icon: FontAwesomeIcons.google,color: Color.fromARGB(255, 233, 30, 30)),
              ],
            ),
            SizedBox(height: 30,),
            RichText(text: TextSpan(
                                                children: [
                                                TextSpan(text: 'Don\'t have an account? ',
                                                style: font15W500.copyWith(color: Color.fromARGB(251, 69, 67, 67))
                                                ),
                                                TextSpan(text: 'Sign up',style: font15W700.copyWith(color: Colors.black,decoration: TextDecoration.underline))
                                                ]
                                              ),),
                                              SignInBlockListener(),
            
              ],
            ),
            
          ],
        ),
      ),
    );
  }
  void validateThenDoLogin(BuildContext context) {
  if(context.read<SignInCubit>().formKey.currentState!.validate()){
    context.read<SignInCubit>().emitSignInState(); 
  }
}
     
}

