import 'package:split_it/modulos/home/models/dashboard_model.dart';

abstract class AppBarState {}

class AppBarStateEmpty extends AppBarState {}

class AppBarStateSucess extends AppBarState {
  DashboardModel dashboard;
  AppBarStateSucess({
    required this.dashboard,
  });
}

class AppBarStateError extends AppBarState {
  String message;
  AppBarStateError({
    required this.message,
  });
}

class AppBarStateLoading extends AppBarState {}
