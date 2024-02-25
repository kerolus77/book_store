import 'package:dartz/dartz.dart';





abstract class ResetPasswordRepo{
  Future <Either<String,String>> sendEmailResetPassword(String email);
}