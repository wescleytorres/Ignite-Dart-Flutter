import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modulos/login/login_state.dart';
import 'package:split_it/modulos/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;

  LoginController({required this.onUpdate});

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      state = LoginStateLoading();
      onUpdate();
      final account = await _googleSignIn.signIn();
      user = UserModel.google(account!);
      state = LoginStateSucess(user: user!);
      onUpdate();
    } catch (error) {
      state = LoginStateError(message: error.toString());
      onUpdate();
    }
  }
}
