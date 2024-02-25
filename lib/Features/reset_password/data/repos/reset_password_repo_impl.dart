import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'reset_password_repo.dart';

class ResetPasswordRepoImpl extends ResetPasswordRepo{
  @override
  Future<Either<String, String>> sendEmailResetPassword(String email) async{

try {
  await FirebaseAuth.instance.sendPasswordResetEmail(email:  email);
  // Password reset email sent successfully
  return right("Password reset email sent successfully.");
} catch (e) {
  // Handle exceptions
  print("Error sending password reset email: $e");
  return left(e.toString());
}
    
  }

}