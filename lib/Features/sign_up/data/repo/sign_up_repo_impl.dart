import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_application_3/Features/sign_up/data/repo/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo{
  @override
  Future<Either<String, int>> signUp(SignUpRequestBody signUpRequestBody) async {
    try {
  final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: signUpRequestBody.email,
    password: signUpRequestBody.password,
  );
  await userCredential.user!.updateDisplayName( '$signUpRequestBody.firstName $signUpRequestBody.firstName');
  await userCredential.user!.reload();
  return right(0);
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    return left('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    return left('The account already exists \nfor that email.');
  }else{
    return left('Please try again');
  }
} catch (e) {
  return left(e.toString());
}
  }

}