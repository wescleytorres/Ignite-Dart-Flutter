import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modulos/login/login_controller.dart';
import 'package:split_it/modulos/login/login_service.dart';
import 'package:split_it/modulos/login/login_state.dart';
import 'package:split_it/modulos/login/models/user_model.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController controller;
  late LoginService service;
  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(service: service);
  });

  test("Testando o Google SingIn retornando Sucesso", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(service.googleSignIn)
        .thenAnswer((_) async => UserModel(email: "e", id: "id"));
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateLoading>());
    expect(states[2], isInstanceOf<LoginStateSucess>());
    expect(states.length, 3);
  });

  test("Testando o Google SingIn retornando Error", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(service.googleSignIn).thenThrow("Deu erro");
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateError>());
    expect((states[1] as LoginStateError).message, "Deu erro");
    expect(states.length, 2);
  });

  test("Testando o metodo listen", () async {
    controller.state = LoginStateLoading();
    mobx.autorun(
        (_) => expect(controller.state, isInstanceOf<LoginStateLoading>()));
  });
}
