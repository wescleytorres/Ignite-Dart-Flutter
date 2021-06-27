import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppbarWidget extends PreferredSize {
  final VoidCallback onTapBack;
  final int actualPage;
  final int size;
  CreateSplitAppbarWidget(
      {required this.actualPage, required this.onTapBack, required this.size})
      : super(
            child: SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      padding: EdgeInsets.only(left: 10),
                      color: AppTheme.colors.gray_600,
                      iconSize: 32,
                      icon: Icon(Icons.arrow_back),
                      onPressed: onTapBack),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "0${actualPage + 1}",
                          style: AppTheme.textstyles.stepperIndicatorPrimary,
                        ),
                        TextSpan(
                          text: " - 0$size",
                          style: AppTheme.textstyles.stepperIndicatorSecondary,
                        )
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(60));
}
