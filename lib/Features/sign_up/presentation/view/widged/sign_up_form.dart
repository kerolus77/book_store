import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/button.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/sign_in_screen.dart';
import 'package:flutter_application_3/Features/sign_up/presentation/view/widged/sign_up_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../constant.dart';
import '../../view_model/cubit/sign_up_cubit.dart';
import 'sign_up_input.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.only(left: 15,right: 10,top: 50),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Text('Create Account',style: font35W700,),
            const SizedBox(height:25 ,),
            Column(
              children: [
                const SignUpInput(),
                const SizedBox(height: 15,),
                Button(label: 'Sign Up', onTap: (){

              validateThenDoLogin(context);
              
            }, color: secondaryColor ),

            const SizedBox(height: 30,),
            RichText(text: TextSpan(
            children: [
              TextSpan(text: 'have an account? ',
              style: font15W500.copyWith(color: const Color.fromARGB(251, 69, 67, 67))
              ),
              TextSpan(text: 'Sign In',
              style: font15W700.copyWith(color: Colors.black,decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap= (){
                Get.offAll(()=>const SignInScreen());

              }
              ),
              
              ]
              ),),
              const SignUpBlockListener(),
              ],
            )
          ],
        ), ),
    );
  }
    void validateThenDoLogin(BuildContext context) {
  if(context.read<SignUpCubit>().signUpFormKey.currentState!.validate()){
    context.read<SignUpCubit>().emitSignUpState(); 
  }
}
}