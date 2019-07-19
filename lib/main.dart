import 'package:flutter/material.dart';

void main() => runApp(Tabs());

class Tabs extends StatefulWidget{
  Tabs({Key key}): super(key:key);
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  
  @override
  
  Widget build(BuildContext context){

    Widget goSection = Container(
      padding: EdgeInsets.fromLTRB(110.0, 100.0, 110.0, 0.0),
      
        child:Container(
           height: 160.0,
           width: 160.0,

           decoration: new BoxDecoration(
            
           border: new Border.all(width: 4.0, color: Color(0xff068586)),
           color:Color(0xff09091A),
           borderRadius: new BorderRadius.all(new Radius.circular(80.0)),
           ),
           child:Text(
                'GO',
                textAlign:TextAlign.center,
                maxLines: 1,
                style:TextStyle(
                  fontSize: 40.0,
                  color:const Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontFamily: '微软雅黑',
                  letterSpacing: 3.0,
                ), 
           ),
           alignment:Alignment.center
        ),

    );

Widget textSection = Container(
  padding: EdgeInsets.fromLTRB(30.0, 60.0, 0.0, 0.0),
child: Column(
        //2个child 竖直 排列
        children: <Widget>[
          //占满剩余空间
          
            // 2 个child 水平 排列
             Row(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.only(right: 10.0),
                  child:Icon(
                  Icons.filter_tilt_shift,
                  color: Colors.white,
                  size: 35.0,
                  ),
                ),
                Text(
                  "Type:",
                  style: TextStyle(
                    color: Colors.white,
                    
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                
                ),
                )
              ],
            ),
         
        Row(
              
              children: <Widget>[
                Container(
                  
                  child: Icon(
                  Icons.alternate_email,
                  color: Colors.white,
                  size: 35.0,
                  ),
                  padding: EdgeInsets.only(right: 10.0),
                ),
                Text(
                  "Server Name:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                    ),
                )
              ],
            ),
            Row(
              
              children: <Widget>[
                Container(
                  
                  child:Icon(
                  Icons.wifi_tethering,
                  color: Colors.white,
                  size: 35.0,
                  ),
                  padding: EdgeInsets.only(right: 10.0),
                ),
                Text(
                  "IP:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                
                ),
                )
              ],
            ),
        ],
      ),
);

      return MaterialApp(
        home: Scaffold(
        backgroundColor:Color(0xff09091A) ,
        appBar: AppBar(
          centerTitle: true,
           title:
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
           Container(
                  child:Icon(
                  Icons.network_check,
                  color: Colors.blueGrey,
                  ),
                  padding: EdgeInsets.only(right: 10.0),
                ),
           Text(
            "SPEEDTEST",
            style:TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w900,
            )
          ),
           ]
           ),
          backgroundColor: Color(0xff09091A),
        ),
        
    body:ListView(
          children: <Widget>[
            goSection,
            textSection,

          ],

      
        

     ),
      
       
      
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor: Color(0xff131322),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.network_check,
              color: Colors.white70,
              size: 30.0,
            ),
            title: Text("Speed",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white70,
              ),),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history,
              color:Colors.white70,
              size: 30.0,
            ),
            title: Text("History",
              style:TextStyle(
                fontSize:15.0,
                color: Colors.white70,
              ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
              color: Colors.white70,
              size:30.0,
            ),
            title: Text("Setting",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
              ),
            ),
          ),
        ] ,),
    ),
    );
  }
}