import 'package:flutter/material.dart';

import 'package:split_it/modulos/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/modulos/home/widgets/loading_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;
  final bool isLoading;

  const EventTileWidget({
    Key? key,
    required this.model,
    this.isLoading = false,
  }) : super(key: key);

  IconDollarType get type =>
      model.value! >= 0 ? IconDollarType.cred : IconDollarType.deb;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Row(
            children: [
              LoadindWidget(size: Size(48, 48)),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: LoadindWidget(size: Size(81, 19)),
                    subtitle: LoadindWidget(size: Size(52, 18)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LoadindWidget(size: Size(61, 17)),
                        SizedBox(
                          height: 5,
                        ),
                        LoadindWidget(size: Size(44, 18)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        : Row(
            children: [
              IconDollarWidget(type: type),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color:
                                  AppTheme.colors.gray_500.withOpacity(0.2)))),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      model.title!,
                      style: AppTheme.textstyles.titleEvent,
                    ),
                    subtitle: Text(
                      model.created.toString(),
                      style: AppTheme.textstyles.subtitleEvent,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'R\$ ${model.value}',
                          style: AppTheme.textstyles.valueEvent,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${model.people} amigo${model.people == 1 ? '' : 's'}",
                          style: AppTheme.textstyles.peopleEvent,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
