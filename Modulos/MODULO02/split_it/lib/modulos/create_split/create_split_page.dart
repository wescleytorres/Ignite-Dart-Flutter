import 'package:flutter/material.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  var index = 0;

  void nextPage() {
    setState(() {
      if (index < 2) index++;
    });
  }

  void prevPage() {
    setState(() {
      if (index > 0) index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          top: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    prevPage();
                  }),
              Text("${index + 1} - ${pages.length}")
            ],
          ),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: pages[index],
      floatingActionButton: index < 2
          ? FloatingActionButton(
              onPressed: () {
                nextPage();
              },
              child: Icon(Icons.add),
            )
          : Container(),
    );
  }
}
