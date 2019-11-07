import 'package:flutter/material.dart';
import 'package:testapp/SecondPage.dart';
import 'package:testapp/components/Submitbutton.dart';
import 'package:testapp/components/input.dart';
import 'package:testapp/helpers/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (this._formKey.currentState.validate()) {
      auth
          .signInWithEmailAndPassword(
              email: _usernameController.text,
              password: _passwordController.text)
          .then((user) {
        if (true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SecondPage(title: _usernameController.text)));
        } else {
          Scaffold.of(_formKey.currentContext).showSnackBar(SnackBar(
            content: Text("Please verified your email"),
          ));
          auth.signOut();
        }
      }).catchError((onError) {
        Scaffold.of(_formKey.currentContext).showSnackBar(SnackBar(
          content: Text(onError.toString()),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _username = Input(
        controller: _usernameController,
        validator: validateUsername,
        hideText: false,
        icon: Icon(Icons.person),
        hint: "Username");

    final _password = Input(
        controller: _passwordController,
        validator: validatePassword,
        hideText: true,
        icon: Icon(Icons.lock),
        hint: "Password");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.display1,
                ),
                _username,
                SizedBox(height: 10.0),
                _password,
                SizedBox(height: 20.0),
                SubmitButton(onPressed: _login, text: "LOGIN")
              ],
            ),
          ),
        ));
  }
}
