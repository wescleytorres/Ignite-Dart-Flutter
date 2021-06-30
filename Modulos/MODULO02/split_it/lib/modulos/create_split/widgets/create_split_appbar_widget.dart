import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modulos/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppbarWidget extends PreferredSize {
  final VoidCallback onTapBack;
  final CreateSplitController controller;
  final int size;
  CreateSplitAppbarWidget(
      {required this.controller, required this.onTapBack, required this.size})
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
                    child: Observer(
                        builder: (_) => Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: "0${controller.currentPage + 1}",
                                  style: AppTheme
                                      .textstyles.stepperIndicatorPrimary,
                                ),
                                TextSpan(
                                  text: " - 0$size",
                                  style: AppTheme
                                      .textstyles.stepperIndicatorSecondary,
                                )
                              ]),
                              textAlign: TextAlign.center,
                            )),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(60));
}
