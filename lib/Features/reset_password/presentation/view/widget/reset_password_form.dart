import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/button.dart';
import 'package:flutter_application_3/Core/widget/input_field.dart';
import 'package:flutter_application_3/Features/reset_password/presentation/view/widget/reset_password_listener.dart';
import 'package:flutter_application_3/Features/reset_password/presentation/view_models/cubit/reset_password_cubit.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 100,left: 20,right: 20),
      child: SingleChildScrollView(child: Center(
        child: Column(
          
          children: [
            Icon(Icons.lock_open_sharp,size: 150,),
            SizedBox(height: 15,),
            Text('Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
            style: font14W600,
            ),
            SizedBox(height: 20,),
            Form(
              key: context.read<ResetPasswordCubit>().resetPasswordFormKey,
              child: InputField(
                title: 'Email Address',
                validator: (value){
                      if(value==null ||value.isEmpty){
                      return 'Please enter a valid email';
                        }
                        },
                hintText: 'example@gmail.com',
                prefixIcon: const Icon(Icons.email_outlined,size: 25,color: borderColor,),
                textInputType: TextInputType.emailAddress,
                        controller: context.read<ResetPasswordCubit>().emailController,
                        ),
            ),
                      SizedBox(height: 20,),
                      Button(label: 'Send', onTap: (){validateThenDoLogin(context);}, color: secondaryColor),

            ResetPasswordListener()
        
          ],
        ),
      )),
       );

  }
      void validateThenDoLogin(BuildContext context) {
  if(context.read<ResetPasswordCubit>().resetPasswordFormKey.currentState!.validate()){
    context.read<ResetPasswordCubit>().emitResetPasswordState(); 
  }
}
}