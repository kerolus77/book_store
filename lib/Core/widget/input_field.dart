// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class InputField extends StatelessWidget {


  final String title;
  final TextEditingController? controller;
  final bool maxLines;
  final TextInputType? textInputType;
  final Widget ? prefixIcon;
  final Widget ? suffixIcon;
  final bool? isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Color? backgroundColor;
  final Function(String?) validator;

  InputField({
    Key? key,
    
    required this.title,
    this.controller,

    this.maxLines=false,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.backgroundColor,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:font16W600 ,),
        const SizedBox(height: 10,),
        TextFormField(
          
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: contentPadding?? const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        hintText: hintText,
                        hintStyle:hintStyle?? font15W500,
                        enabledBorder:enabledBorder?? const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 1.3,
                          ),
                        ),
                        focusedBorder:focusedBorder?? const OutlineInputBorder(
                          borderSide: BorderSide(
                            //color: secondaryColor,
                            width: 1.3,
                          ),
                        ),
                         errorBorder: const OutlineInputBorder(
          borderSide:   BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          
        ),
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon,
                      ),
                      obscureText:isObscureText??false ,
                      
                      controller: controller,
                      autofocus: false,
                      keyboardType:textInputType ,
                      style: font16W600,
                      cursorColor: borderColor,
                      validator: (value) {
                        return validator(value);
                      },
                
                      
                    ),
      ],
    );
  }
}
