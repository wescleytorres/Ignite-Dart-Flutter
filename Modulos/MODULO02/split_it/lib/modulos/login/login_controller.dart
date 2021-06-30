import 'package:mobx/mobx.dart';
import 'package:split_it/modulos/login/login_service.dart';
import 'package:split_it/modulos/login/login_state.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginService service;

  _LoginControllerBase({required this.service});

  @observable
  LoginState state = LoginStateEmpty();

  @action
  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      final user = await service.googleSignIn();
      state = LoginStateSucess(user: user);
    } catch (error) {
      state = LoginStateError(message: error.toString());
    }
  }
}
