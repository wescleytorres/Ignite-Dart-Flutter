import 'package:flutter/material.dart';
import 'package:split_it/modulos/create_split/create_split_controller.dart';
import 'package:split_it/modulos/create_split/step/one/step_one_page.dart';
import 'package:split_it/modulos/create_split/step/three/step_three_page.dart';
import 'package:split_it/modulos/create_split/step/two/step_two_page.dart';
import 'package:split_it/modulos/create_split/widgets/bottom_stepper_bar_widget.dart';
import 'package:split_it/modulos/create_split/widgets/create_split_appbar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        onChange: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      StepTwoPage(),
      StepThreePage(),
    ];
    super.initState();
  }

  var index = 0;

  void nextPage() {
    setState(() {
      if (index < 2) index++;
    });
  }

  void prevPage() {
    setState(() {
      if (index > 0) index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      appBar: CreateSplitAppbarWidget(
        actualPage: index,
        onTapBack: prevPage,
        size: pages.length,
      ),
      body: pages[index],
      bottomNavigationBar: BottomStepperBarWidget(
        enabledButtons: controller.enableNavigateButton(),
        onTapNext: nextPage,
        onTapCancel: () {},
      ),
    );
  }
}
