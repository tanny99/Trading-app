import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
import 'buttonX.dart';
import 'front_screen.dart';
class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(position, size.height / 2), 12, Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset(position, size.height/2 - 40 ), 20, Paint()..color = Colors.white);
  }
  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}
class ColorPicker extends StatefulWidget {

  final double width;
  final String time;
  ColorPicker({this.width,this.time});
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

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _colorSliderPosition=0;
    if(widget.time=="1min"||widget.time=="5min"||widget.time=="15min"){
      _colorSliderPosition = 30;
    }
    if(widget.time=="30min"||widget.time=="1hour"||widget.time=="5hour"){
      _colorSliderPosition = 100;
    }
    if(widget.time=="daily"||widget.time=="weekly"||widget.time=="monthly"){
      _colorSliderPosition = 150;
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
                painter: _SliderIndicatorPainter(_colorSliderPosition),),
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
