import 'package:split_it/modulos/home/models/dashboard_model.dart';
import 'package:split_it/modulos/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashboardModel> getDashBoard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashboardModel(credit: 100, debit: 50);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: 100, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: 100, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: 100, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: 100, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: 100, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: -33, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: -50, people: 2),
      EventModel(
          title: "Churrasco", created: DateTime.now(), value: 100, people: 2),
    ];
  }
}
