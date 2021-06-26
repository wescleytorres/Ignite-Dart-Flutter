import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get appBar;
  TextStyle get labelInfoCard;
  TextStyle get valueInfoCard1;
  TextStyle get valueInfoCard2;
  TextStyle get titleEvent;
  TextStyle get subtitleEvent;
  TextStyle get valueEvent;
  TextStyle get peopleEvent;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
        color: AppTheme.colors.gray_500,
        fontSize: 16,
      );

  @override
  TextStyle get labelInfoCard => GoogleFonts.inter(
        color: AppTheme.colors.gray_500,
        fontSize: 14,
      );

  @override
  TextStyle get valueInfoCard1 => GoogleFonts.inter(
        color: AppTheme.colors.green_500,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get valueInfoCard2 => GoogleFonts.inter(
        color: AppTheme.colors.red_400,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        color: AppTheme.colors.green_500,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get appBar => GoogleFonts.montserrat(
        color: AppTheme.colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get titleEvent => GoogleFonts.inter(
        color: AppTheme.colors.gray_600,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get subtitleEvent => GoogleFonts.inter(
        color: AppTheme.colors.gray_500,
        fontSize: 12,
      );

  @override
  TextStyle get valueEvent => GoogleFonts.inter(
        color: AppTheme.colors.gray_500,
        fontSize: 14,
      );

  @override
  TextStyle get peopleEvent => GoogleFonts.inter(
        color: AppTheme.colors.gray_300,
        fontSize: 12,
      );
}
