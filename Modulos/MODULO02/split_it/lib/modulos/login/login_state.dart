import 'package:split_it/modulos/login/models/user_model.dart';

abstract class LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateError extends LoginState {
  final String message;
  LoginStateError({required this.message});
}

class LoginStateSucess extends LoginState {
  final UserModel user;
  LoginStateSucess({
    required this.user,
  });
}
