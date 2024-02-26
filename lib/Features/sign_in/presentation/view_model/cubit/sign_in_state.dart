import 'package:freezed_annotation/freezed_annotation.dart';

part  'sign_in_state.freezed.dart';

@freezed
class SignInState<T> with _$SignInState<T> {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = Loadingl;
  const factory SignInState.success(T data) = Success<T>;
  const factory SignInState.error({ String? errMessage}) = Error;

}
