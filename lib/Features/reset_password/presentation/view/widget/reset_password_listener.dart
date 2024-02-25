
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/reset_password/presentation/view_models/cubit/reset_password_cubit.dart';
import 'package:flutter_application_3/Features/reset_password/presentation/view_models/cubit/reset_password_state.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';



class ResetPasswordListener extends StatelessWidget {
  const ResetPasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit,ResetPasswordState>(
      listenWhen: (previous, current)=>current is Loading||current is Success||current is Error,
      listener: (context, state) {
      state.whenOrNull(
        loading: (){
          showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              ),
            );
        },
        success: (success){
          Get.back();
          setUpErrorState(context,success);

        },
        error: (errMessage) {
          setUpErrorState(context,errMessage);
        },
        
      );
    },
    child: const SizedBox.shrink(),
    );
  }
  
  void setUpErrorState(BuildContext context, String errMessage) {
          Get.back();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          errMessage,
          style: font15W700,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Got it',
              style: font16W600,
            ),
          ),
        ],
      ),
    );
  }
  }
