import 'package:split_it/modulos/home/repositories/home_repository.dart';
import 'package:split_it/modulos/home/repositories/home_repository_mock.dart';
import 'package:split_it/modulos/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository repository;

  Function(AppBarState state)? onListen;

  AppBarState state = AppBarStateEmpty();

  AppBarController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  getDashboard() async {
    update(AppBarStateLoading());
    try {
      final response = await repository.getDashBoard();
      update(AppBarStateSucess(dashboard: response));
    } catch (e) {
      update(AppBarStateError(message: e.toString()));
    }
  }

  void update(AppBarState state) {
    this.state = state;
    if (onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(AppBarState state) onChange) {
    onListen = onChange;
  }
}
