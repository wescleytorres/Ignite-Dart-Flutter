import 'package:flutter/material.dart';
import 'package:notes/Components/button_add.dart';

import 'Components/card_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CardList(),
      ),
      floatingActionButton: ButtonAdd(),
    );
  }
}
