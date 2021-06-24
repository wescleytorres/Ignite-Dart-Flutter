import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>['Primeiro Item'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          for (var i = 0; i < notes.length; i++)
            Card(
              child: ListTile(
                title: Text(notes[i]),
                onTap: () async {
                  var response = await Navigator.pushNamed(
                      context, '/create-note',
                      arguments: notes[i]);
                  if (response != null) {
                    var description = response as String;
                    setState(() {
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }
                    });
                  }
                },
              ),
            )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final description =
              await Navigator.pushNamed(context, '/create-note');
          setState(() {
            if (description != null) notes.add(description as String);
          });
        },
      ),
    );
  }
}
