
import 'package:flutter/material.dart';
import 'Speed.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('start页面'),
      ),
      body: Center(
        child:RaisedButton(
          child: Text('GO'),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> BODY1Page()
              )
           );
          },
        )
      ),
    );
}
}