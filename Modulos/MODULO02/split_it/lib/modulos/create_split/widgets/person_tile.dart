import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTile extends StatelessWidget {
  final FriendModel data;
  final bool isRemoved;
  final VoidCallback onPressed;
  const PersonTile({
    Key? key,
    required this.data,
    this.isRemoved = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: AppTheme.colors.gray_100.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(data.photoURL),
                fit: BoxFit.cover,
              ))),
      title: Text(
        data.name,
        style: isRemoved
            ? AppTheme.textstyles.personSelectedStepper
            : AppTheme.textstyles.personNotSelectedStepper,
      ),
      trailing: IconButton(
        icon: isRemoved
            ? Icon(
                Icons.remove,
                color: AppTheme.colors.red_400,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.green_500,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
