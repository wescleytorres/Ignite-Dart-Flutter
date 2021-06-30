import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:split_it/modulos/create_split/create_split_controller.dart';
import 'package:split_it/modulos/create_split/widgets/stepper_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final CreateSplitController controller;
  final bool enabledButtons;
  const BottomStepperBarWidget({
    Key? key,
    required this.onTapCancel,
    required this.onTapNext,
    required this.controller,
    this.enabledButtons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: AppTheme.colors.gray_600.withOpacity(0.2),
        ))),
        height: 72,
        child: Row(
          children: [
            Observer(
                builder: (_) => StepperButtonWidget(
                      enabled: controller.enableNavigateButton,
                      label: "CANCELAR",
                      onTap: onTapCancel,
                    )),
            Container(
              width: 1,
              height: double.maxFinite,
              color: AppTheme.colors.gray_600.withOpacity(0.2),
            ),
            Observer(
                builder: (_) => StepperButtonWidget(
                      enabled: controller.enableNavigateButton,
                      label: "CONTINUAR",
                      onTap: onTapNext,
                    )),
          ],
        ),
      ),
    );
  }
}
