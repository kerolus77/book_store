// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';

class InputField extends StatelessWidget {

  final String hint;
  final String title;
  final TextEditingController? controller;
  final Widget? widget;
  final bool maxLines;
  final TextInputType? textInputType;
  final Widget ? prefixIcon;
  final Widget ? suffixIcon;
  final bool? isObscureText;


  InputField({
    Key? key,
    required this.hint,
    required this.title,
    this.controller,
    this.widget,
    this.maxLines=false,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:font16W600 ,),
        SizedBox(height: 10,),
        TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        
                        hintText: hint,
                        hintStyle: font15W500,
                        enabledBorder: const OutlineInputBorder(
                          
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 1.3,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            //color: secondaryColor,
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
                      readOnly: widget != null ? true : false,
                      style: font16W600,
                      cursorColor: borderColor,
                                      
                
                      
                    ),
      ],
    );
  }

// bool isRequiredFieldValid(String? value) {
//   return value != null && value.isNotEmpty;
// }
// String? _validation(String? value, String field) {
//     if (field == 'Title' || field == 'Note') {
//       if (value == null || value.isEmpty) {
//         setState(() {
//        test =true;
//         });
//       }
//     }
//     return null;
//   }
}
