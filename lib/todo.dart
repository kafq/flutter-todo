import 'package:flutter/material.dart';


class TodosState extends State<Todos> {
  final _todos = <String>[
    'render shadows',
    'add interactivity',
    'split code',
    'add firebase',
    'find state management solution',
    'go to the project house',
    'make a decision',
    'talk about project',
    'add more todos',
    'change table location',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: <Widget>[
        _buildTodos(),
      ],
    ));
  }

  Widget _buildTodos() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: _todos.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          final index = i;
          return _buildRow(_todos[index]);
        });
  }

  Widget _buildRow(String todo) => TodoHero(
        todo: todo,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoRoute(todo: todo)),
          );
        },
      );
}

class Todos extends StatefulWidget {
  @override
  TodosState createState() => TodosState();
}

class Todo extends StatelessWidget {
  final String todo;
  final double fontSize;
  const Todo({Key key, this.todo, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(title: Text(todo, style: TextStyle(fontSize: fontSize))),
    );
  }
}

class TodoHero extends StatelessWidget {
  const TodoHero({Key key, this.todo, this.onTap, this.fontSize})
      : super(key: key);

  final String todo;
  final VoidCallback onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Hero(
      tag: todo,
      child: Material(
        color: Colors.transparent,
        child:
            InkWell(onTap: onTap, child: Todo(todo: todo, fontSize: fontSize)),
      ),
    ));
  }
}

class TodoRoute extends StatelessWidget {
  final String todo;
  const TodoRoute({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: TodoHero(
          todo: todo,
          onTap: Navigator.of(context).pop,
          fontSize: 32,
        )),
      ),
    );
  }
}