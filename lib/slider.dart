import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'brain.dart';
import 'buttons.dart';
import 'buttonX.dart';
import 'package:provider/provider.dart';
import 'front_screen.dart';
class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  final Color color;
  final String data;
  _SliderIndicatorPainter({this.position,this.color,this.data});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(position, size.height / 2), 12, Paint()..color = color);
    canvas.drawCircle(
        Offset(position, size.height/2 - 45 ), 30, Paint()..color = color);
    TextSpan span = new TextSpan(
        text: '$data',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.white,));
    canvas.rotate(-1.59);
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);

    tp.layout(minWidth: 14, maxWidth: 52);


    tp.paint(canvas, Offset(12.0, position-12));
  }
  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}
class ColorPicker extends StatefulWidget {

  final double width;
  final String time;
  final String summary;
  ColorPicker({this.width,this.time,this.summary});
  @override
  _ColorPickerState createState() => _ColorPickerState();
}
class _ColorPickerState extends State<ColorPicker> {
  final List<Color> _colors = [
    Color(0xff007AFF),
    Color(0xff004999),
    Color(0xffFEB846),
    Color(0xff991C30),
    Color(0xffFF2E50),
  ];

  double _shadeSliderPosition;
  Color _currentColor;
  Color _shadedColor;
  bool isloading=false;
  @override
  initState() {
    super.initState();

  }





  @override
  Widget build(BuildContext context) {
    double _colorSliderPosition=0;
    Color color;
    if(widget.time=="weekly"||widget.time=="1min"||widget.time=="monthly"||widget.time=="15min"||widget.time=="1hour"){
      _colorSliderPosition = 10;
      color=Color(0xff004999);
    }
    if(widget.time=="30min"){
      _colorSliderPosition = 30;
      Color(0xff007AFF);
    }
    if(widget.time=="daily"||widget.time=="5min"){
      _colorSliderPosition = 100;
      color=Color(0xffFEB846);
    }
    if(widget.time=="1min"){
      _colorSliderPosition = 150;
      color=Color(0xffFF2E50);
    }
    if(widget.time=="5hour"||widget.time=="15min"||widget.time=="1hour"||widget.time=="30min"){
      _colorSliderPosition = 170;
      color=Colors.red[900];
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [RotatedBox(
            quarterTurns: 1,
            child: Container(
              width: widget.width,
              height: 15,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey[800]),
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: _colors),
              ),
              child: CustomPaint(
                painter: _SliderIndicatorPainter(position: _colorSliderPosition,color: color,data: widget.summary),),
              ),
            ),

          ],
        ),
        SizedBox(width: Responsive.width(60, context),),
          Column(

            children: [
              buttonsX(text: '1 MIN',
                  borderColor: Colors.white,
                  bodyColor: Colors.black,time: '1min',),
              buttonsX(text: '5 MIN',time: '5min',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '15 MIN',time: '15min',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '30 MIN',time: '30min',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '1 HR',time: '1hour',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '5 HR',time: '5hour',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '1 DAY',time: 'daily',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '1 WK',time: 'weekly',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttonsX(text: '1 MON',time: 'monthly',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
            ],
          )
        ]);
  }

}
