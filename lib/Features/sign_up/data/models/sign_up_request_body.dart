// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';
@JsonSerializable()

class SignUpRequestBody {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  SignUpRequestBody({
    required this.firstName,
     this.lastName='',
    required this.email,
    required this.password,
  });
  
Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
  
}
