import 'package:flutter/material.dart';
import 'Taps.dart';
void main(List<String> args) {
 runApp(MyApp()); 
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Taps(),
    );
  }
}