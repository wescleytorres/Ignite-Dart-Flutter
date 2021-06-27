import 'package:flutter/material.dart';

import 'package:split_it/modulos/create_split/widgets/stepperButtonWidget.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final bool enabledButtons;
  const BottomStepperBarWidget({
    Key? key,
    required this.onTapCancel,
    required this.onTapNext,
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
            StepperButtonWidget(
                enabled: enabledButtons, label: "CANCELAR", onTap: onTapCancel),
            Container(
              width: 1,
              height: double.maxFinite,
              color: AppTheme.colors.gray_600.withOpacity(0.2),
            ),
            StepperButtonWidget(
                enabled: enabledButtons, label: "CONTINUAR", onTap: onTapNext),
          ],
        ),
      ),
    );
  }
}
