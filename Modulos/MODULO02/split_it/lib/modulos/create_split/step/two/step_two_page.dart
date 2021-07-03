import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modulos/create_split/step/two/step_two_controller.dart';
import 'package:split_it/modulos/create_split/widgets/person_tile.dart';
import 'package:split_it/modulos/create_split/widgets/step_input_text.dart';
import 'package:split_it/modulos/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  final controller = StepTwoController();

  @override
  void initState() {
    controller.getFriends();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Com quem ",
          subtitle: "você quer dividir?",
        ),
        StepInputTextWidget(
          onChange: (value) {
            controller.onChange(value);
          },
          hintText: "Nome da pessoa",
        ),
        SizedBox(
          height: 35,
        ),
        Observer(builder: (_) {
          if (controller.selectedFriends.isEmpty) {
            return Container();
          } else {
            return Column(children: [
              ...controller.selectedFriends
                  .map((e) => PersonTile(
                        data: e,
                        isRemoved: true,
                        onPressed: () {
                          controller.removeFriend(e);
                        },
                      ))
                  .toList(),
              SizedBox(
                height: 16,
              ),
            ]);
          }
        }),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text("Nenhum amigo encontrado");
          } else {
            return Column(
              children: controller.items
                  .map((e) => PersonTile(
                        data: e,
                        onPressed: () {
                          controller.addFriend(e);
                        },
                      ))
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
