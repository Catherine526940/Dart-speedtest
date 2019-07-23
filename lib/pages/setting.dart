import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //testing//////////////
          Container(
            alignment: Alignment(-1, 0),
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
            child: Text(
              'TESTING',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 21.0),
            ),
          ),
          //分割线///////////////
          Container(
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: Divider.createBorderSide(context,
                        width: 1.0, color: Colors.grey))),
          ),
          //第一行///////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(
                    context,
                    width: 3.0,
                  ))),
                  child: Text(
                    "Units",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                    ),
                  )),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(context,
                              width: 3.0, color: Color(0xff1FF8E8)))),
                  child: Text(
                    "Mbps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(
                    context,
                    width: 3.0,
                  ))),
                  child: Text(
                    "MB/s",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(
                    context,
                    width: 3.0,
                  ))),
                  child: Text(
                    "kB/s",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
            ],
          ),
          //分割线///////////////
          Container(
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: Divider.createBorderSide(context,
                        width: 1.0, color: Colors.grey))),
          ),
          //第二行/////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(
                    context,
                    width: 3.0,
                  ))),
                  child: Text(
                    "Scale",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                    ),
                  )),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(context,
                              width: 3.0, color: Color(0xff1FF8E8)))),
                  child: Text(
                    "100",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(
                    context,
                    width: 3.0,
                  ))),
                  child: Text(
                    "500",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  width: 60.0,
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: Divider.createBorderSide(
                    context,
                    width: 3.0,
                  ))),
                  child: Text(
                    "1000",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
            ],
          ),
          //分割线///////////////
          Container(
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: Divider.createBorderSide(context,
                        width: 1.0, color: Colors.grey))),
          ),
          /////////////////////
        ],
      ),
    );
  }
}
