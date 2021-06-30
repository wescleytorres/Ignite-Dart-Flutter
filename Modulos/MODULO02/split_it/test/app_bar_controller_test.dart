import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modulos/home/models/dashboard_model.dart';
import 'package:split_it/modulos/home/repositories/home_repository.dart';
import 'package:split_it/modulos/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modulos/home/widgets/app_bar/app_bar_state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController controller;
  late HomeRepository repository;
  setUp(() {
    repository = HomeRepositoryMock();
    controller = AppBarController(repository: repository);
  });

  test("Testando o GetDashboard - Sucesso", () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(repository.getDashBoard)
        .thenAnswer((_) async => DashboardModel(credit: 100, debit: 50));
    await controller.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateEmpty>());
    expect(states[1], isInstanceOf<AppBarStateLoading>());
    expect(states[2], isInstanceOf<AppBarStateSucess>());
    expect(states.length, 3);
  });

  test("Testando o GetDashboard - Error", () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(repository.getDashBoard).thenThrow("Deu erro");
    await controller.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateEmpty>());
    expect(states[1], isInstanceOf<AppBarStateError>());
    expect((states[1] as AppBarStateError).message, "Deu erro");
    expect(states.length, 2);
  });
}
