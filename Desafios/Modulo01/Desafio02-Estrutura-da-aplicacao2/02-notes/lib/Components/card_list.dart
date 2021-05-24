import 'package:flutter/material.dart';
import 'package:notes/Controller/card_controller.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CardController.instance,
      builder: (context, child) {
        var card = CardController.instance.notes;
        return Column(
          children: [
            for (var i = 0; i < card.length; i++)
              Card(
                child: ListTile(
                  title: Text(card[i]),
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                        context, '/create-note',
                        arguments: card[i]);
                    if (response != null) {
                      var description = response as String;
                      setState(() {
                        if (response.isEmpty) {
                          CardController.instance.removeNote(i);
                        } else {
                          CardController.instance.updateNote(i, description);
                        }
                      });
                    }
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
