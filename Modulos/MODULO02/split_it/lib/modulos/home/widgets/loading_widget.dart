import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_it/theme/app_theme.dart';

class LoadindWidget extends StatelessWidget {
  final Size size;
  const LoadindWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Shimmer.fromColors(
        baseColor: AppTheme.colors.gray_100.withOpacity(0.5),
        highlightColor: AppTheme.colors.gray_300.withOpacity(0.4),
        child: Container(
          color: AppTheme.colors.green_200,
        ),
      ),
    );
  }
}
