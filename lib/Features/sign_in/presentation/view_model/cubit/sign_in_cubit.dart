// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_3/Features/sign_in/data/models/sign_in_request_body.dart';

import 'package:flutter_application_3/Features/sign_in/data/repo/sign_in_repo.dart';

import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
final SignInRepo signInRepo;
  SignInCubit(
    this.signInRepo,
  ) : super(const SignInState.initial());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void emitSignInState()async{
      emit(const SignInState.loading());
      final response=await signInRepo.SignIn(
        SignInRequestBody(email: emailController.text, password: passwordController.text)
      );
      response.fold((failure){
        emit(SignInState.error(errMessage: failure));
      }, (success){
        emit(SignInState.success(success));
      });
}
}