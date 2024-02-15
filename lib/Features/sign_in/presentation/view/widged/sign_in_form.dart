import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/widget/button.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widged/input_field.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view/widged/social_media_image.dart';
import 'package:flutter_application_3/size_config.dart';
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
    bool isObscureText=true;
  final GlobalKey<FormState>formKey=GlobalKey();
  
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
            Form(
                          key: formKey,
                          child:Column(
                            children: [
                               InputField( title: 'Email',
                                hint: 'example@gmail.com',
                          prefixIcon: const Icon(Icons.email_outlined,size: 25,color: borderColor,),
                          textInputType: TextInputType.emailAddress,),
                          const SizedBox(height:15 ,),
                           InputField(
                            title: 'Password',
                             hint: 'password',
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
                          const SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot password !',style:font15W700,),
                            
                          ),
                          const SizedBox(height: 20,),
                          Button(label: 'Sign in', onTap: (){}, color: secondaryColor),
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
                          SizedBox(height: SizeConfig.screenHeight/5,),
                          RichText(text: TextSpan(
                                                    children: [
                                                    TextSpan(text: 'Don\'t have an account? ',
                                                    style: font15W500.copyWith(color: Color.fromARGB(251, 69, 67, 67))
                                                    ),
                                                    TextSpan(text: 'Sign up',style: font15W700.copyWith(color: Colors.black,decoration: TextDecoration.underline))
                                                    ]
                                                  ),)
                          
                            
                            
                            ,
                          
                            ],
                          )
                        ),
            
          ],
        ),
      ),
    );
  }
     String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}