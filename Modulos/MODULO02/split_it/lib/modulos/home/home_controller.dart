import 'package:split_it/modulos/home/home_state.dart';
import 'package:split_it/modulos/home/repositories/home_repository.dart';
import 'package:split_it/modulos/home/repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository repository;
  Function(HomeState state)? onListen;

  HomeState state = HomeStateEmpty();

  HomeController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  getEvents() async {
    update(HomeStateLoading());
    try {
      final response = await repository.getEvents();
      update(HomeStateSucess(events: response));
    } catch (e) {
      update(HomeStateError(message: e.toString()));
    }
  }

  void update(HomeState state) {
    this.state = state;
    if (onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(HomeState state) onChange) {
    onListen = onChange;
  }
}
