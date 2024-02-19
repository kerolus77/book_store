import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/services/app_regex.dart';
import '../../../../../constant.dart';
import '../../../../sign_in/presentation/view/widged/password_validations.dart';
import '../../view_model/cubit/sign_up_cubit.dart';

class SignUpInput extends StatefulWidget {
  const SignUpInput({super.key});

  @override
  State<SignUpInput> createState() => _SignUpInputState();
}

class _SignUpInputState extends State<SignUpInput> {
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
    passwordController=context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();

  }
// @override
//   void dispose() {
//     context.read<SignUpCubit>().disposeFormKey();
//     super.dispose();
//   }
  
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
      key: context.read<SignUpCubit>().signUpFormKey,
      child:Column(
        children: [
          InputField(title: 'First Name',
           hintText: '',
           controller:context.read<SignUpCubit>().firstNameController,
            validator: (value){
                                  if(value==null ||value.isEmpty){
                                    return 'Please enter a name';
                                  }
                                },
            ),
            const SizedBox(height:15 ,),
            InputField(title: 'Last Name',
           hintText: '',
            validator: (value){},
            controller: context.read<SignUpCubit>().lastNameController,
            ),
            const SizedBox(height:15 ,),
            InputField(
              title: 'Email',
              hintText: 'example@gmail.com',
              validator: (value){
                if(value==null ||value.isEmpty){
                return 'Please enter a valid email';
                }
              },
              prefixIcon: const Icon(Icons.email_outlined,size: 25,color: borderColor,),
              textInputType: TextInputType.emailAddress,
              controller: context.read<SignUpCubit>().emailController,
                          ),
                          const SizedBox(height:15 ,),
                           InputField(
                            validator: (value){
                              if(value==null ||value.isEmpty){
                                return 'Please enter a valid password';
                               }
                              else if(!hasLowerCase||!hasMinLength||!hasNumber||!hasSpecialCharacters||!hasUpperCase){
                                return '';
                              }
                            },
                            controller: context.read<SignUpCubit>().passwordController,
                            title: 'Password',
                             hintText: 'password',
                          prefixIcon: const Icon(Icons.lock_outline,size: 25,color: borderColor),
                          textInputType: TextInputType.visiblePassword,
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
                          !hasLowerCase||!hasMinLength||!hasNumber||!hasSpecialCharacters||!hasUpperCase?PasswordValidations(hasLowerCase: hasLowerCase,
                           hasUpperCase: hasUpperCase,
                            hasSpecialCharacters: hasSpecialCharacters,
                             hasNumber: hasNumber, 
                             hasMinLength: hasMinLength):SizedBox.shrink(),
                             const SizedBox(height:15 ,),
                           InputField(
                            title: 'Confirm Password',
                             hintText: 'password',
                            validator: (value){
                              if(value==null ||value.isEmpty||value!=passwordController.text){
                                return 'Please enter a valid password';
                               }
                              
                            },
                            //controller: context.read<SignUpCubit>().passwordController,
                            
                          prefixIcon: const Icon(Icons.lock_outline,size: 25,color: borderColor),
                          textInputType: TextInputType.visiblePassword,
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

        ],
      ) );
  }
}