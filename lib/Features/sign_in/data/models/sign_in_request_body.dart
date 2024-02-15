// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_body.g.dart';

@JsonSerializable()
class SignInRequestBody {
  final String email;
  final String password;
  SignInRequestBody({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => _$SignInRequestBodyToJson(this);
  

}
