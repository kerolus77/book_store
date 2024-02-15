import 'package:dartz/dartz.dart';
import 'package:flutter_application_3/Features/sign_in/data/models/sign_in_request_body.dart';

abstract class SignInRepo{
  Future <Either<String,int>> SignIn(SignInRequestBody signInRequestBody);
}