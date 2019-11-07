import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key, this.title, this.content}) : super(key: key);
  final String title;
  final String content;
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          new Expanded(
            child: new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: new Text(
                      widget.content,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
