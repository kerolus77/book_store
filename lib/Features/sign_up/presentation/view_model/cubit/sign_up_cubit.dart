// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_application_3/Features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(
    this.signUpRepo,
  ) : super(SignUpState.initial());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    final signUpFormKey = GlobalKey<FormState>();

    void emitSignUpState()async{
       emit(SignUpState.loading());
      final response =await signUpRepo.signUp(SignUpRequestBody(firstName: firstNameController.text,
      lastName: lastNameController.text,
       email: emailController.text, password: passwordController.text));
       response.fold((failure){
        emit(SignUpState.error(errMessage: failure));
       } , (success){
        emit(SignUpState.success(success));
       });
    }

    void disposeFormKey() {
    signUpFormKey.currentState?.dispose();
  }
}
