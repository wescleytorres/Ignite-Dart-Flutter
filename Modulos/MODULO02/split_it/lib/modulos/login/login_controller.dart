import 'package:flutter/foundation.dart';
import 'package:split_it/modulos/login/login_service.dart';
import 'package:split_it/modulos/login/login_state.dart';
import 'package:split_it/modulos/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  final LoginService service;
  Function(LoginState state)? onChange;

  LoginController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSignIn();
      state = LoginStateSucess(user: user);
      update();
    } catch (error) {
      state = LoginStateError(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
