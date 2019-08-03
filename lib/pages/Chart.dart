/**
 * User:wfl
 * date:2018.7.29
 */
//折线图
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'dart:async';
import 'package:flutter/widgets.dart';

//链接speedtest页面
class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//定义横坐标的属性和颜色
class ClicksPerYear {
  //定义横坐标的属性
  final int second;
  final int clicks;
  final charts.Color color;
  //颜色
  ClicksPerYear(this.second, this.clicks, Color color)
      : this.color = new charts.Color(
          r: color.red,
          g: color.green,
          b: color.blue,
          a: color.alpha,
        );
}

//横轴的数值
class TimeSeriesSales {
  final DateTime time;
  final int sales;
  TimeSeriesSales(this.time, this.sales);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 4;
  //起始的坐标
  final serialdata = [
    new TimeSeriesSales(new DateTime(1), 5),
    // new TimeSeriesSales(new DateTime(2), 25),
    // new TimeSeriesSales(new DateTime(3), 100),
    // new TimeSeriesSales(new DateTime(4), 75),
  ];
  Random random = new Random(); //随机产生的数据
  int ii=0;

  //事件
  void _incrementCounter() {
    const period = const Duration(milliseconds: 400); 
    Timer.periodic(period, (timer) {
      //到时回调
      setState(() {
        ii++;
        _counter++;
        serialdata.add(new TimeSeriesSales(new DateTime(_counter), random.nextInt(200))); //y轴的最大值
      });
      if (ii >= 34) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
       }
    });
  }

  @override
  void initState() {
    super.initState();
    _incrementCounter();
  }

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

    return GestureDetector(
      //////////////////图形的最终效果

      onPanDown: (index) {
        _incrementCounter(); //////////////////点击事件
      },
      child: chartWidget, /////////////图形画出折线图
    );
  }
}
