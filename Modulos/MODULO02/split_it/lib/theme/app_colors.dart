import 'package:flutter/material.dart';

abstract class AppColors {
  Color get white;
  Color get green_500;
  Color get green_200;
  Color get gray_600;
  Color get gray_500;
  Color get gray_300;
  Color get gray_20;
}

class AppColorsDefault implements AppColors {
  @override
  Color get white => Color(0xFFFFFFFF);

  @override
  Color get green_500 => Color(0xFF40B38C);

  @override
  Color get green_200 => Color(0xFF4DE6A6);

  @override
  Color get gray_600 => Color(0xFF455250);

  @override
  Color get gray_500 => Color(0xFF666666);

  @override
  Color get gray_300 => Color(0xFFA4B2AE);

  @override
  Color get gray_20 => Color(0xFFDCE0E5);
}
