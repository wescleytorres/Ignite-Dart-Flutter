import 'package:flutter/material.dart';

import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final void Function(String) onChange;
  final String hintText;
  final TextAlign align;
  final EdgeInsets? padding;

  const StepInputTextWidget({
    Key? key,
    required this.onChange,
    required this.hintText,
    this.align = TextAlign.center,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 64),
      child: TextField(
        onChanged: onChange,
        textAlign: align,
        style: AppTheme.textstyles.textfieldStepper,
        cursorColor: AppTheme.colors.gray_500,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textstyles.placeholderStepper,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.gray_600.withOpacity(0.2),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.gray_600.withOpacity(0.2),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.gray_600.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
