import 'package:flutter/material.dart';
import 'package:testapp/styles/color.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  _renderPage() {
    return MyHomePage(title: 'Flutter Demo');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: MixinColor.greenLand,
            accentColor: MixinColor.greenLand,
            buttonTheme:
                ButtonThemeData(padding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
            fontFamily: 'Overpass',
            appBarTheme: AppBarTheme(
                textTheme: TextTheme(title: TextStyle(fontSize: 20))),
            textTheme: TextTheme(
                display1: TextStyle(fontSize: 96),
                display2: TextStyle(fontSize: 60),
                headline: TextStyle(fontSize: 20),
                subhead: TextStyle(fontSize: 16), //input Text place holder
                subtitle: TextStyle(fontSize: 14),
                title: TextStyle(fontSize: 20),
                body1: TextStyle(fontSize: 16),
                body2: TextStyle(fontSize: 14),
                button: TextStyle(fontSize: 16),
                caption: TextStyle(fontSize: 12),
                overline: TextStyle(fontSize: 10))),
        home: _renderPage());
  }
}
