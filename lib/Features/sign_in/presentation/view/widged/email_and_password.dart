import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/services/app_regex.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widged/password_validations.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import 'input_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText=true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController=context.read<SignInCubit>().passwordController;
    setupPasswordControllerListener();

  }

  
void setupPasswordControllerListener() {
  passwordController.addListener(() { 
    setState(() {
      hasLowerCase=AppRegex.hasLowerCase(passwordController.text);
      hasUpperCase=AppRegex.hasUpperCase(passwordController.text);
      hasSpecialCharacters=AppRegex.hasSpecialCharacter(passwordController.text);
      hasNumber=AppRegex.hasNumber(passwordController.text);
      hasMinLength=AppRegex.hasMinLength(passwordController.text);

    });
  });
}
  @override
  Widget build(BuildContext context) {
    return Form(
                          key: context.read<SignInCubit>().formKey,
                          child:Column(
                            children: [
                               InputField( 
                                validator: (value){
                                  if(value==null ||value.isEmpty){
                                    return 'Please enter a valid email';
                                  }
                                },
                                title: 'Email',
                                hintText: 'example@gmail.com',
                          prefixIcon: const Icon(Icons.email_outlined,size: 25,color: borderColor,),
                          textInputType: TextInputType.emailAddress,
                          controller: context.read<SignInCubit>().emailController,
                          ),
                          const SizedBox(height:15 ,),
                           InputField(
                            validator: (value){
                              if(value==null ||value.isEmpty){
                                return 'Please enter a valid password';
                              }else if(!hasLowerCase||!hasMinLength||!hasNumber||!hasSpecialCharacters||!hasUpperCase){
                                return '';
                              }
                            },
                            controller: context.read<SignInCubit>().passwordController,
                            title: 'Password',
                             hintText: 'password',
                          prefixIcon: const Icon(Icons.lock_outline,size: 25,color: borderColor),
                          textInputType: TextInputType.emailAddress,
                          isObscureText: isObscureText,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText=!isObscureText;
                              });
                            },
                            child: Icon(isObscureText?Icons.visibility_off_outlined:Icons.visibility_outlined,
                            color: isObscureText?borderColor:Colors.black,
                            size: 25,
                            ),
                            
                          ),),
                          SizedBox(height: 10,),
                          PasswordValidations(hasLowerCase: hasLowerCase,
                           hasUpperCase: hasUpperCase,
                            hasSpecialCharacters: hasSpecialCharacters,
                             hasNumber: hasNumber, 
                             hasMinLength: hasMinLength)
                          
                            
                            
                            
                          
                            ],
                          )
                        ) ;
  }
 
}
