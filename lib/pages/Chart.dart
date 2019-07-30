/**
 * User:wfl
 * date:2018.7.29
 */
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
 
class Chart extends StatelessWidget {///////////////链接ｓｐｅｅｄｔｅsｔ页面
  @override
  Widget build(BuildContext context) {
    return  MyHomePage();
  }
}
 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
 
  final String title;
 
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
 
class ClicksPerYear {///////////////////定义横坐标的属性
  final int second;
  final int clicks;
  final charts.Color color;
 
  ClicksPerYear(this.second, this.clicks, Color color)//////////////颜色
      : this.color = new charts.Color(
      r: color.red,
      g: color.green, 
      b: color.blue, 
      a: color.alpha,
      
      );
}
 
 
class TimeSeriesSales {////////////////////横轴的数值
  final DateTime time;
  final int sales;
 
  TimeSeriesSales(this.time, this.sales);
}
 
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 4;
 
  final serialdata = [
    new TimeSeriesSales(new DateTime (1), 5),//////////起始的坐标
    // new TimeSeriesSales(new DateTime(2), 25),
    // new TimeSeriesSales(new DateTime(3), 100),
    // new TimeSeriesSales(new DateTime(4), 75),
  ];
  Random random = new Random();//////////////随机产生的数据
 
  void _incrementCounter(){////////////////事件
    setState(() {
      _counter++;
      serialdata.add(new TimeSeriesSales(new DateTime(_counter),random.nextInt(100)));//y轴的最大值
    });
  }
 
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TimeSeriesSales, DateTime>> seriesList = [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: serialdata,
      )
    ];
 
    var chart = new charts.TimeSeriesChart(
      seriesList,
      animate: true,
    );
    var chartWidget = new Padding(
      padding: new EdgeInsets.all(5.0),
      child: new SizedBox(
        height: 110.0,
        child: chart,
      ),
    );
 
    return GestureDetector(               //////////////////图形的最终效果
    
          onPanDown: (index){
            _incrementCounter();               //////////////////点击事件
          },
          child: chartWidget,                          /////////////图形画出折线图
        ); 
  }
  
}
