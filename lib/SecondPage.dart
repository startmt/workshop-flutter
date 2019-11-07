import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/components/TodoList.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Firestore firestore = Firestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('todo').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Text('Loading data... Please wait');
                  return new ListView(
                      children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                          return new TodoList(
                            title: document['title'],
                            content: document['content'],
                          );
                      }).toList(),
                    );
                })));
  }
}
