// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Features/sign_in/data/models/sign_in_request_body.dart';
import 'package:flutter_application_3/Features/sign_in/data/repo/sign_in_repo.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class SignInRepoImpl implements SignInRepo{

  
  //normal sign in
  @override
  Future <Either<String,int>> signIn(SignInRequestBody signInRequestBody)async {
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
//google sign in
@override
  Future<Either<String?,UserCredential?>> signInWithGoogle() async {
  try {
    
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      
      return left(null);
    }

   
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

   
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    
    return right(await FirebaseAuth.instance.signInWithCredential(credential)) ;
  } catch (error) {
    
    return left('Error signing in with Google: $error');
    
  }
}

//facebook sign in
  @override
  Future<Either<String?, UserCredential?>> signInWithFacebook()async {
    try {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Check if the user canceled the login process
    if (loginResult.status == LoginStatus.cancelled) {
      return left(null);
    }

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return right(await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)) ;
  } catch (error) {
    print('Error signing in with Facebook: $error');
    return left('Error signing in with Facebook: $error');
    
  }
}
  

// twitter sign in
  @override
  Future<Either<String?, UserCredential?>> signInWithTwitter() async {
     try {
    // Create a TwitterLogin instance
    final twitterLogin =  TwitterLogin(
      apiKey: '<your consumer key>',
      apiSecretKey: '<your consumer secret>',
      redirectURI: '<your_scheme>://',
    );

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Check if the user canceled the login process
    if (authResult.status == TwitterLoginStatus.cancelledByUser) {
      return left(null);
    }

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    return right(await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential));
  } catch (error) {
    print('Error signing in with Twitter: $error');
    return left('Error signing in with Twitter: $error');
   
  }
  }

}