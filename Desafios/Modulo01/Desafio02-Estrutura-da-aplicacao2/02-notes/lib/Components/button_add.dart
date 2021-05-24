import 'package:flutter/material.dart';
import 'package:notes/Controller/card_controller.dart';

class ButtonAdd extends StatefulWidget {
  @override
  _ButtonAddState createState() => _ButtonAddState();
}

class _ButtonAddState extends State<ButtonAdd> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent)),
      child: Icon(
        Icons.add,
        size: 30,
      ),
      onPressed: () async {
        final description = await Navigator.pushNamed(context, '/create-note');

        setState(() {
          if (description != null)
            CardController.instance.addNote(description as String);
        });
      },
    );
  }
}
