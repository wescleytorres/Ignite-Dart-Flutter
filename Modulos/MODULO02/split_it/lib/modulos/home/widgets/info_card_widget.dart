import 'package:flutter/material.dart';
import 'package:split_it/modulos/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/modulos/home/widgets/loading_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class InfoCardWidget extends StatelessWidget {
  final double value;
  final bool isLoading;
  const InfoCardWidget({
    Key? key,
    required this.value,
    this.isLoading = false,
  }) : super(key: key);

  TextStyle get textStyle => value >= 0
      ? AppTheme.textstyles.valueInfoCard1
      : AppTheme.textstyles.valueInfoCard2;

  IconDollarType get iconDollarType =>
      value >= 0 ? IconDollarType.cred : IconDollarType.deb;

  String get textInfo => value >= 0 ? 'A receber' : 'A pagar';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 156,
      height: 168,
      decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
              BorderSide(color: AppTheme.colors.gray_100))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDollarWidget(
            type: iconDollarType,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textInfo,
                style: AppTheme.textstyles.labelInfoCard,
              ),
              SizedBox(
                height: 4,
              ),
              isLoading
                  ? LoadindWidget(size: Size(94, 24))
                  : Text(
                      "R\$ $value",
                      style: textStyle,
                    ),
            ],
          )
        ],
      ),
    );
  }
}
