import 'package:flutter/material.dart';
import 'package:split_it/modulos/create_split/widgets/person_tile.dart';
import 'package:split_it/modulos/create_split/widgets/step_input_text.dart';
import 'package:split_it/modulos/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Com quem ",
          subtitle: "você quer dividir?",
        ),
        StepInputTextWidget(
          onChange: (value) {},
          hintText: "Nome da pessoa",
        ),
        SizedBox(
          height: 35,
        ),
        PersonTile(name: "Wescley Torres"),
        PersonTile(name: "Wescley Torres"),
        PersonTile(name: "Wescley Torres"),
      ],
    );
  }
}
