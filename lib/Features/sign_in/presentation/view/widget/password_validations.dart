// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    Key? key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
                const SizedBox(height:2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        const SizedBox(height:2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        const SizedBox(height:2),
        buildValidationRow('At least 1 number', hasNumber),
        const SizedBox(height:2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }
  
  Widget buildValidationRow(String text, bool hasValidated) {
   return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: Colors.grey,
      ),
      const SizedBox(width: 5,),
      Text(text,style: font13DarkBlueRegular.copyWith(
        decoration:hasValidated?TextDecoration.lineThrough:null,
        decorationColor: Colors.green,
        decorationThickness: 2,
        color: hasValidated?Colors.grey:secondaryColor
         ),)

    ],
   );
  }
}
