import 'package:flutter/material.dart';
import 'package:split_it/modulos/create_split/widgets/step_input_text.dart';
import 'package:split_it/modulos/create_split/widgets/step_title_widget.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Qual ou quais",
          subtitle: "ítens você quer dividir?",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text("1"),
              ),
              Expanded(
                flex: 3,
                child: StepInputTextWidget(
                  padding: EdgeInsets.zero,
                  onChange: (value) {},
                  hintText: "Ex: Picanha",
                  align: TextAlign.start,
                ),
              ),
              Expanded(
                child: StepInputTextWidget(
                  padding: EdgeInsets.zero,
                  onChange: (value) {},
                  hintText: "R\$ 0,00",
                  align: TextAlign.start,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
