import 'package:flutter/material.dart';
import 'package:split_it/modulos/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modulos/home/widgets/app_bar/app_bar_state.dart';
import 'package:split_it/modulos/home/widgets/info_card_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard();
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCardWidget(
                  value: 0,
                  isLoading: true,
                ),
                InfoCardWidget(
                  value: -1,
                  isLoading: true,
                ),
              ],
            ),
          );
        }
      case AppBarStateSucess:
        {
          final dashboard = (controller.state as AppBarStateSucess).dashboard;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCardWidget(
                  value: dashboard.credit,
                ),
                InfoCardWidget(
                  value: -dashboard.debit,
                ),
              ],
            ),
          );
        }
      case AppBarStateError:
        {
          final message = (controller.state as AppBarStateError).message;
          return Container(
            child: Text(message),
          );
        }

      default:
        {
          return Container();
        }
    }
  }
}
