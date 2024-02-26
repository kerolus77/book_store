import 'package:dartz/dartz.dart';

import '../models/sign_up_request_body.dart';



abstract class SignUpRepo{
  Future <Either<String,int>> signUp(SignUpRequestBody signUpRequestBody);
}