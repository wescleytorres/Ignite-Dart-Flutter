import 'package:flutter/material.dart';

import 'package:split_it/theme/app_theme.dart';

class StepperButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool enabled;

  const StepperButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
      onPressed: enabled ? onTap : null,
      child: Text(label,
          style: enabled
              ? AppTheme.textstyles.textBottomNavigator
              : AppTheme.textstyles.textBottomNavigatorDisabled),
    ));
  }
}
