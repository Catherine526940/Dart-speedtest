import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            SizedBox(height: 30.0),
            Text(
              'Type',
              style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            SizedBox(width: 30.0),
            Text(
              'Date',
              style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            SizedBox(width: 30.0),
            Text("\t\t\t"),
            Icon(
              Icons.file_download,
              color:Color(0xff11fff3)
            ),
            Text(
              'Mbps',
              style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            SizedBox(width: 30.0),
            Icon(
              Icons.file_upload,
              color:Color(0xffd86fff)
            ),
            Text(
              'Mbps',
              style:TextStyle(color: Colors.white,fontSize:20)
            ),
          ],
        ),
        
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('     '),
            Icon(Icons.wifi,size: 30,color:Color(0xff11fff3)),
            SizedBox(width: 40.0),
            Text(
              '07/13/19\n10:34',
              style:TextStyle(color: Colors.white)
            ),
            SizedBox(width: 40.0),
            Text(
              "232",
              style: TextStyle(color: Colors.white,fontSize: 25.0)
            ),
            SizedBox(width: 50.0),
            Text(
              "153",
              style: TextStyle(color: Colors.white,fontSize: 25.0)
            ),
          ],
        ),
        SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('     '),
            Icon(Icons.settings_input_antenna,size: 30,color:Color(0xff11fff3)),
            SizedBox(width: 40.0),
            Text(
              '07/13/19\n09:37',
              style:TextStyle(color: Colors.white)
            ),
            SizedBox(width: 40.0),
            Text(
              "91.5",
              style: TextStyle(color: Colors.white,fontSize: 25.0)
            ),
            SizedBox(width: 40.0),
            Text(
              "197",
              style: TextStyle(color: Colors.white,fontSize: 25.0)
            ),
          ],
        ),
      ],
    );
  }
}