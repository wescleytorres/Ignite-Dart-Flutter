import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum IconDollarType { cred, deb }

class IconDollarWidget extends StatelessWidget {
  final IconDollarType type;

  const IconDollarWidget({Key? key, required this.type}) : super(key: key);

  String get pathImage =>
      "assets/icons/icon${type == IconDollarType.cred ? 'Cred' : 'Deb'}.png";

  Color get backgroundColor => type == IconDollarType.cred
      ? AppTheme.colors.green_500.withOpacity(0.12)
      : AppTheme.colors.red_400.withOpacity(0.12);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      width: 48,
      height: 48,
      child: Center(
        child: Image.asset(
          pathImage,
          width: 32,
        ),
      ),
    );
  }
}
