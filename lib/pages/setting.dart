import 'package:flutter/material.dart';
import 'speed.dart';
import 'history.dart';
class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 20, 36, 1),
             centerTitle: true,
            title:  Text(
                'S E T T I N G',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(78, 201, 176, 1)
                  ),
              ),
            ),
        body: Container(
          child: Column(children: <Widget>[
            //testing//////////////
        Container(
          alignment: Alignment(-1, 0),
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
          child: Text(
            'TESTING',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 21.0
          ),
          ),
        ),
        //分割线///////////////
        Container(
           decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width: 1.0,
               color: Colors.grey
               ) 
             )
           ),
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
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               ) 
             )
           ),
             child:Text(
                  "Units",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                
                ),
              )
            ),
                
                 Container(
              width: 60.0,
               height: 50.0,
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               color:Color(0xff1FF8E8)
               ) 
             )
           ),
             child:Text(
                  "Mbps",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                
                ),
              )
            ), Container(
              width: 60.0,
               height: 50.0,
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               ) 
             )
           ),
             child:Text(
                  "MB/s",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                
                ),
              )
            ),
                 Container(
              width: 60.0,
               height: 50.0,
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               ) 
             )
           ),
             child:Text(
                  "kB/s",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                
                ),
              )
            ),
              ],
            ),
        //分割线///////////////
        Container(
           decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width: 1.0,
               color: Colors.grey
               ) 
             )
           ),
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
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               ) 
             )
           ),
             child:Text(
                  "Scale",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                
                ),
              )
            ),
                
                 Container(
              width: 60.0,
              height: 50.0,
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               
               color:Color(0xff1FF8E8)
               ) 
             )
           ),
             child:Text(
                  "100",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                
                ),
              )
            ), Container(
              width: 60.0,
              height: 50.0,
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               ) 
             )
           ),
             child:Text(
                  "500",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                
                ),
              )
            ),
                 Container(
              width: 60.0,
              height: 50.0,
              alignment: Alignment(0,0),
              decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width:3.0,
               ) 
             )
           ),
             child:Text(
                  "1000",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                
                ),
              )
            ),
              ],
            ),
        //分割线///////////////
        Container(
           decoration: new BoxDecoration(
            
           border: new Border(
             bottom:Divider.createBorderSide(
               context,
               width: 1.0,
               color: Colors.grey
               ) 
             )
           ),
        ),
        ///////////////////// 
            SizedBox(height:454),
            




            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(21, 20, 36, 1),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.network_check,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SpeedPage()));
                    },
                    color: Color.fromRGBO(21, 20, 36, 1),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(21, 20, 36, 1),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.history,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HistoryPage()));
                    },
                    color: Color.fromRGBO(21, 20, 36, 1),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(21, 20, 36, 1),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Null;
                    },
                    color: Color.fromRGBO(78, 201, 176, 0.5),
                  ),
                ),////
              ],
            ), 
          ],),
        ),
        backgroundColor: Color.fromRGBO(21, 20, 36, 0.99),
        );
  }
}