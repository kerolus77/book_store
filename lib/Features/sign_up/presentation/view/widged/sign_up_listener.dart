import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view/home.dart';

import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../view_model/cubit/sign_up_cubit.dart';
import '../../view_model/cubit/sign_up_state.dart';

class SignUpBlockListener extends StatelessWidget {
  const SignUpBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
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
          Get.offAll(()=>Home());

        },
        error: (errMessage) {
          setUpErrorState(context,errMessage);
        },
        
      );
    },
    child: SizedBox.shrink(),
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
