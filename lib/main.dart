import 'package:flutter/material.dart';
import 'todo.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, item) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    Filter(),
                    Todos(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 40, 12, 40),
      child: Text(
        'Project tasks',
        style: TextStyle(
          fontSize: 80,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Label(count: 12, text: 'all'),
          Label(count: 2, text: 'random'),
          Spacer(),
          FlatButton(
            child: Text('add new'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNewRoute()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddNewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Center(child: Text('Add new'),)
      
    );
  }
}

class Label extends StatelessWidget {
  final int count;
  final String text;
  const Label({Key key, this.count, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(count.toString(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Text(' $text', style: TextStyle(fontSize: 16, color: Colors.black)),
        SizedBox(width: 24),
      ],
    );
  }
}

