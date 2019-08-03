/*
 * User:wfl
 * date:2018.7.29
 */
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DashBoardState();
  }
}

//此表盘为按压转动，使用onPanDown属性触发 | 分为两部分：表盘；指针和显示数据；

class DashBoardState extends State<DashBoard> {
  //画出外表大圆
  final platform = const MethodChannel('com.flutter.lgyw/sensor');
  bool _isGetPressure = false;
  int pressures = 0;
  final double wholeCirclesRadian = 6.283185307179586;

  ///一个圆被分割为160份，但是只显示120份，另外40份为隐藏的下半部分
  final int tableCount = 160;
  Size dashBoardSize;
  double tableSpace;
  Picture _pictureBackGround;
  Picture _pictureIndicator;

  @override
  void initState() {
    super.initState();
    dashBoardSize = new Size(300.0, 300.0); //盘大小
    tableSpace = wholeCirclesRadian / tableCount;
    _pictureBackGround =
        DashBoardTablePainter(tableSpace, dashBoardSize).getBackGround();
    _pictureIndicator = IndicatorPainter(dashBoardSize).drawIndicator();
    //一下两行把onPanDown里面的内容放这就可以自己转了
    _isGetPressure = true;
    boostSpeed();
  }

//////////////画指针速度
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: new CustomPaint(
        //画布
        size: dashBoardSize, //表盘大小
        painter: new DashBoardIndicatorPainter(
            pressures, tableSpace, _pictureBackGround, _pictureIndicator),
      ),
    );
  }

//控制触发旋转的函数
  void boostSpeed() async {
    for (int i = 0; i <= 8; i++) {
      while (_isGetPressure) {
        if (pressures < 100) {
          setState(() {
            pressures++;
          });
        } else {
          _isGetPressure = false;
        }
        await Future.delayed(new Duration(milliseconds: 10)); //转盘触发后转速10
      }
      _isGetPressure = true;
      while (_isGetPressure) {
        if (pressures > 55) {
          setState(() {
            pressures--;
          });
        } else {
          _isGetPressure = false;
        }
        await Future.delayed(new Duration(milliseconds: 9)); //转盘触发后转速9
      }
      _isGetPressure = true;
    }
  }

//控制减速的两个函数
  void handleEndEvent() {
    _isGetPressure = false;
    bringDownSpeed();
  }

  void bringDownSpeed() async {
    while (!_isGetPressure) {
      setState(() {
        pressures--;
      });
      if (pressures <= 0) {
        break;
      }
      await Future.delayed(new Duration(milliseconds: 5)); //回转速度5
    }
  } //
}

//仪表指针转动部分
class DashBoardIndicatorPainter extends CustomPainter {
  final int speeds;
  double tableSpace;
  final Picture pictureBackGround;
  final Picture pictureIndicator;

  DashBoardIndicatorPainter(this.speeds, this.tableSpace,
      this.pictureBackGround, this.pictureIndicator);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPicture(pictureBackGround);
    drawIndicator(canvas, size);
    String text; /////////////////中间的数字显示
    if (speeds < 100) {
      ////////////////////数字格式（还未显示）
      text = (speeds * 2).toString() + "Mbps";
    } else {
      int s = speeds - 100;
      text = (100 * 2 + s * 3).toString() + "Mbps";
    }
    drawSpeendOnDashBoard(text, canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///画实时得速度值显示到面板上
  void drawSpeendOnDashBoard(String text, Canvas canvas, Size size) {
    //数字位置
    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2; //

    canvas.save();

    canvas.translate(halfWidth, halfHeight);
    //显示数字属性
    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        //---Mbps文本的属性
        text: text,
        style: new TextStyle(
            color: Colors.white,
            fontSize: 33.0,
            fontWeight: FontWeight.w100)); //

    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2; //数值居中
    double textStarPositionY = 85; //调整数据垂直位置
    textPainter.paint(
      canvas,
      new Offset(textStarPositionX, textStarPositionY),
    );
    canvas.restore(); //确保数字固定在下方，不随指针移动
  }

  ///表盘指针
  void drawIndicator(Canvas canvas, Size size) {
    //保持指针居中
    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2; //

    canvas.save(); //显示数字---Mbps
    //以下不能交换位置
    canvas.translate(halfWidth, halfHeight); //指针居中
    canvas.rotate((-60 + speeds) * tableSpace); //指针初始位置
    canvas.translate(-halfWidth, -halfHeight); //指针居中
    canvas.drawPicture(pictureIndicator);
    canvas.restore(); //确保数字固定在下方，不随指针移动
  }
}

class IndicatorPainter {
  final PictureRecorder _recorder = PictureRecorder();
  final Size size;
  IndicatorPainter(this.size);

  ///画速度指针
  Picture drawIndicator() {
    Canvas canvas = Canvas(_recorder);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2;
    Path path = new Path();
    path.moveTo(-2.5, 20);
    path.lineTo(2.5, 20);
    path.lineTo(6.0, -30);
    path.lineTo(0.5, -halfHeight + 8);
    path.lineTo(-0.5, -halfHeight + 8);
    path.lineTo(-6.0, -30);
    path.close();
    canvas.save();

    canvas.translate(halfWidth, halfHeight);

    Paint paint = new Paint();
    paint.color = Color(0xffC3C4CA);
    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    paint.color = Colors.black;
    canvas.drawCircle(new Offset(0.0, 0.0), 6, paint);

    canvas.restore();
    return _recorder.endRecording();
  }
}

class DashBoardTablePainter {
  ////////////////画出外表大圆刻度

  final double tableSpace;
  var speedTexts = [
    "0",
    "20",
    "40",
    "60",
    "80",
    "100",
    "120",
    "140",
    "160",
    "180",
    "200",
    "230",
    "260"
  ];
  final Size size;
  final PictureRecorder _recorder = PictureRecorder();

  DashBoardTablePainter(this.tableSpace, this.size);

  Picture getBackGround() {
    Canvas canvas = Canvas(_recorder);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    drawTable(canvas, size);
    return _recorder.endRecording();
  }

  ///画仪表盘的表格
  void drawTable(Canvas canvas, Size size) {
    canvas.save();
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;
    canvas.translate(halfWidth, halfHeight);

    Paint paintMain = new Paint();
    paintMain.color = Color(0xff00B1BC);
    paintMain.strokeWidth = 2.5;
    paintMain.style = PaintingStyle.fill;

    Paint paintOther = new Paint();
    paintOther.color = Colors.blue;
    paintOther.strokeWidth = 1;
    paintOther.style = PaintingStyle.fill;

    drawLongLine(canvas, paintMain, halfHeight, speedTexts[6]);

    canvas.save();
    for (int i = 61; i <= 120; i++) {
      canvas.rotate(tableSpace);
      if (i % 10 == 0) {
        int a = (i / 10).ceil();
        changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfHeight, speedTexts[a]);
      } else if (i % 5 == 0) {
        changePaintColors(paintMain, i);
        drawMiddleLine(canvas, paintMain, halfHeight);
      } else {
        changePaintColors(paintOther, i);
        drawSmallLine(canvas, paintOther, halfHeight);
      }
    }
    canvas.restore();

    canvas.save();
    for (int i = 59; i >= 0; i--) {
      canvas.rotate(-tableSpace);
      if (i % 10 == 0) {
        int a = (i / 10).ceil();
        changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfHeight, speedTexts[a]);
      } else if (i % 5 == 0) {
        changePaintColors(paintMain, i);
        drawMiddleLine(canvas, paintMain, halfHeight);
      } else {
        changePaintColors(paintOther, i);
        drawSmallLine(canvas, paintOther, halfHeight);
      }
    }
    canvas.restore();

    canvas.restore();
  }

  //表盘颜色
  void changePaintColors(Paint paint, int value) {
    if (value <= 15) {
      paint.color = Color(0xff00C272);
    } else if (value <= 30) {
      paint.color = Color(0xff00BD93);
    } else if (value <= 45) {
      paint.color = Color(0xff00B6A5);
    } else if (value <= 60) {
      paint.color = Color(0xff00B1BC);
    } else if (value <= 75) {
      paint.color = Color(0xff00ADCD);
    } else if (value <= 85) {
      paint.color = Color(0xff00A6EA);
    } else if (value < 100) {
      paint.color = Color(0xff0074ea);
    } else if (value < 110) {
      paint.color = Color(0xff3338ea);
    } else {
      paint.color = Color(0xff6713ec);
    }
  }

  ///画仪表盘上的长线
  void drawLongLine(
      Canvas canvas, Paint paintMain, double halfHeight, String text) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + 15), paintMain);

    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        text: text,
        style: new TextStyle(
          color: paintMain.color,
          fontSize: 15.5,
        ));
    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2;
    double textStarPositionY = -halfHeight + 19;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));
  }

  void drawMiddleLine(Canvas canvas, Paint paintMain, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + 10), paintMain);
  }

  ///画短线
  void drawSmallLine(Canvas canvas, Paint paintOther, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + 7), paintOther);
  }
}
