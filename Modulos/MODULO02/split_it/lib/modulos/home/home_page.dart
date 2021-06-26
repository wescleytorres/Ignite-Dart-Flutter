import 'package:flutter/material.dart';
import 'package:split_it/modulos/home/home_controller.dart';
import 'package:split_it/modulos/home/home_state.dart';
import 'package:split_it/modulos/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/modulos/home/widgets/event_tile_widget.dart';
import 'package:split_it/modulos/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          Navigator.pushNamed(context, "/create_split");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (controller.state is HomeStateLoading) ...[
                ...List.generate(
                    4,
                    (index) => EventTileWidget(
                          isLoading: true,
                          model: EventModel(),
                        )),
              ] else if (controller.state is HomeStateSucess) ...[
                ...(controller.state as HomeStateSucess)
                    .events
                    .map((e) => EventTileWidget(model: e))
                    .toList(),
              ] else if (controller.state is HomeStateError) ...[
                Text((controller.state as HomeStateError).message)
              ] else ...[
                Container(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
