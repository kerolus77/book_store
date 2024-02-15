// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Features/sign_in/data/models/sign_in_request_body.dart';
import 'package:flutter_application_3/Features/sign_in/data/repo/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo{

  
  
  @override
  Future <Either<String,int>> SignIn(SignInRequestBody signInRequestBody)async {
    try {
  final 
  credential = await  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: signInRequestBody.email,
    password: signInRequestBody.password
    
    );
  return right(0);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    return left('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    return left('Wrong password provided for that user.');
  } else if (e.code == 'invalid-credential') {
    print('Invalid credentials provided for sign-in.');
    return left('Worng Email Or Password');
  } else {
    print('Unknown error code: ${e.code}');
    return left('Please try again');
  }
} catch (e) {
  return left('Please try again');
}
  }

}