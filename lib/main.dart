import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){ 
    return MaterialApp(
      title: 'Text widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: new Text('hello', style: TextStyle(fontSize: 40.0)),
            alignment: Alignment.center,
            width: 500.0,
            height: 400,
            : Colors.red,
          ),
        ),
      ),
    );
  }
}