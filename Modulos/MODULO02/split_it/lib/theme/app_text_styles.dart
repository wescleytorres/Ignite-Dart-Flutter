import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
        color: AppTheme.colors.gray_500,
        fontSize: 16,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        color: AppTheme.colors.green_500,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );
}
