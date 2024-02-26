import 'package:flutter/material.dart';
import 'package:flutter_application_3/Features/home/presentation/view/home.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:flutter_application_3/Features/sign_in/presentation/view_model/cubit/sign_in_state.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignInBlockListener extends StatelessWidget {
  const SignInBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit,SignInState>(
      listenWhen: (previous, current)=>current is Loadingl||current is Success||current is Error,
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
          Get.offAll(()=>const Home());

        },
        error: (errMessage) {
          errMessage==null?null:
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
          style: font15W700ellipsis,
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
