import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as prefix1;

//求屏幕宽和高
MediaQueryData data = MediaQueryData.fromWindow(ui.window);
double screenWidth = data.size.width;
double screenHeight = data.size.height;

class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
  
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller; //动画控制
  Animation<double> animation; //动画
  List<Offset> _points = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
    duration: const Duration(seconds: 40), vsync: this);

    var tween = Tween(begin: 0.0, end: 0.0); //最多大概160
    animation = tween.animate(controller);
    animation.addListener(() {
    render(_points, animation.value);
     });  
    controller.forward();//动画开始。
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 47, 1),
      body: CustomPaint(
      painter: AnimView(_points),
      ),
    );
  }
//定义变量，但是这样定义是不对的，第一个单词字母小写，第二个单词字母大写
  double x1 = 0;
  double x2 = 0;
  double y1 = 0; //因为y1里面又赋值了，所以不需要先给它赋值
  double y2 = 0;
  double i = 5;
  double m = 5;

  void render(List<Offset> _points, double value) {
     if (x1 <= screenWidth) {
      _points.add(
        Offset(x1, -y1), //y1是从远程传过来的，本身是正数。
      );
      x1 = x1 +0.87;
      y1 = screenHeight * 0.1 + i * sqrt(x1);
      i = i - 0.0032;
      setState(() {});
    }   
    else if (x2 <= screenWidth) {
      _points.add(
        Offset(x2, -y2), //跟第一条曲线一样，不过这条曲线是下降的。
      );
      x2 = x2 + 0.86;
      y2 = screenHeight * 0.21 - m * sqrt(x2);
      m = m - 0.0032;
      setState(() {});
    }
  }
}

class AnimView extends CustomPainter {
  List<Offset> _points;
  Paint mPaint;
  Paint gridPaint;
  AnimView(this._points) {
    mPaint = new Paint();
    gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue;
    mPaint
      ..color = Colors.lightBlue //颜色
      ..strokeWidth = 1.5; //线的颜色及线的粗细
  }

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawPath(
    //     gridPath(area: Size(0, 0)), gridPaint); //Size里面确定的是网格的范围，（0，0）的话就等于没有
    canvas.translate(0, 0.21 * screenHeight); //画布平移
    canvas.drawCircle(
        Offset(0, 0),
        1,
        gridPaint
          ..color = Colors.black
          ..style = PaintingStyle.fill);
    _drawStar(canvas, _points);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _drawStar(Canvas canvas, List<Offset> pos) {
    canvas.drawPoints(PointMode.points, pos, mPaint);
  }
}

Path gridPath({double step = 5, Size area}) {
  Path path = Path();
//   //控制高不让其超过最高处
  for (int i = 0; i < area.height / step + 1; i++) {
    path.moveTo(0, step * i); //移动到画线
    path.lineTo(area.width, step * i); //移动之后加上线条
  }
// //控制宽不让其超过最宽边处
  for (int i = 0; i < area.width / step + 1; i++) {
    path.moveTo(step * i, 0);
    path.lineTo(step * i, area.height);
  }
  return path;
}
