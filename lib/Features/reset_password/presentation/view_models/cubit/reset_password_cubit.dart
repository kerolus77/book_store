// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_3/Features/reset_password/data/repos/reset_password_repo.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo resetPasswordRepo;
  ResetPasswordCubit(
    this.resetPasswordRepo,
  ) : super(ResetPasswordState.initial());
  TextEditingController emailController = TextEditingController();
  final resetPasswordFormKey = GlobalKey<FormState>();

  void emitResetPasswordState() async{
    emit(ResetPasswordState.loading());
    final response =await resetPasswordRepo.sendEmailResetPassword(emailController.text);
    response.fold((failure){
      emit(ResetPasswordState.error(errMessage: failure));
    } , (success){
      emit(ResetPasswordState.success(success));
    }); 

  }
}
