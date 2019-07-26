import 'package:flutter/material.dart';

class AaboutPage extends StatelessWidget {
  const AaboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(21, 20, 36, 1),
        title: Text(
          'SPEEDTEST',                                    //头标题
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(78, 201, 176, 1)
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("1.0.0",style: TextStyle(color: Colors.white))  //版本号
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(21, 20, 36, 1),
    );
  }
}