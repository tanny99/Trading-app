import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';

class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(position, size.height / 2), 12, Paint()..color = Colors.white);
  }
  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}
class ColorPicker extends StatefulWidget {

  final double width;
  ColorPicker(this.width);
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
  double _colorSliderPosition = 0;
  double _shadeSliderPosition;
  Color _currentColor;
  Color _shadedColor;

  @override
  initState() {
    super.initState();
    _currentColor = _calculateSelectedColor(_colorSliderPosition);
    _shadeSliderPosition = widget.width / 2; //center the shader selector
    _shadedColor = _calculateShadedColor(_shadeSliderPosition);
  }

  _colorChangeHandler(double position) {
    //handle out of bounds positions
    if (position > widget.width) {
      position = widget.width;
    }
    if (position < 0) {
      position = 0;
    }
    print("New pos: $position");
    setState(() {
      _colorSliderPosition = position;
      _currentColor = _calculateSelectedColor(_colorSliderPosition);
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
    });
  }

  _shadeChangeHandler(double position) {
    //handle out of bounds gestures
    if (position > widget.width) position = widget.width;
    if (position < 0) position = 0;
    setState(() {
      _shadeSliderPosition = position;
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
      print(
          "r: ${_shadedColor.red}, g: ${_shadedColor.green}, b: ${_shadedColor
              .blue}");
    });
  }

  Color _calculateShadedColor(double position) {
    double ratio = position / widget.width;
    if (ratio > 0.5) {
      //Calculate new color (values converge to 255 to make the color lighter)
      int redVal = _currentColor.red != 255
          ? (_currentColor.red +
          (255 - _currentColor.red) * (ratio - 0.5) / 0.5)
          .round()
          : 255;
      int greenVal = _currentColor.green != 255
          ? (_currentColor.green +
          (255 - _currentColor.green) * (ratio - 0.5) / 0.5)
          .round()
          : 255;
      int blueVal = _currentColor.blue != 255
          ? (_currentColor.blue +
          (255 - _currentColor.blue) * (ratio - 0.5) / 0.5)
          .round()
          : 255;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (ratio < 0.5) {
      //Calculate new color (values converge to 0 to make the color darker)
      int redVal = _currentColor.red != 0
          ? (_currentColor.red * ratio / 0.5).round()
          : 0;
      int greenVal = _currentColor.green != 0
          ? (_currentColor.green * ratio / 0.5).round()
          : 0;
      int blueVal = _currentColor.blue != 0
          ? (_currentColor.blue * ratio / 0.5).round()
          : 0;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      //return the base color
      return _currentColor;
    }
  }

  Color _calculateSelectedColor(double position) {
    //determine color
    double positionInColorArray =
    (position / widget.width * (_colors.length - 1));
    print(positionInColorArray);
    int index = positionInColorArray.truncate();
    print(index);
    double remainder = positionInColorArray - index;
    if (remainder == 0.0) {
      _currentColor = _colors[index];
    } else {
      //calculate new color
      int redValue = _colors[index].red == _colors[index + 1].red
          ? _colors[index].red
          : (_colors[index].red +
          (_colors[index + 1].red - _colors[index].red) * remainder)
          .round();
      int greenValue = _colors[index].green == _colors[index + 1].green
          ? _colors[index].green
          : (_colors[index].green +
          (_colors[index + 1].green - _colors[index].green) * remainder)
          .round();
      int blueValue = _colors[index].blue == _colors[index + 1].blue
          ? _colors[index].blue
          : (_colors[index].blue +
          (_colors[index + 1].blue - _colors[index].blue) * remainder)
          .round();
      _currentColor = Color.fromARGB(255, redValue, greenValue, blueValue);
    }
    return _currentColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [RotatedBox(
            quarterTurns: 1,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragStart: (DragStartDetails details) {
                print("_-------------------------STARTED DRAG");
                _colorChangeHandler(details.localPosition.dx);
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                _colorChangeHandler(details.localPosition.dx);
              },
              onTapDown: (TapDownDetails details) {
                _colorChangeHandler(details.localPosition.dx);
              },
              //This outside padding makes it much easier to grab the   slider because the gesture detector has
              // the extra padding to recognize gestures inside of
              child: Container(
                width: widget.width,
                height: 15,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey[800]),
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: _colors),
                ),
                child: CustomPaint(
                  painter: _SliderIndicatorPainter(_colorSliderPosition),
                ),
              ),
            ),
          ),
          ],
        ),
        SizedBox(width: Responsive.width(60, context),),
          Column(

            children: [
              buttons(text: '1 MIN',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '5 MIN',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '15 MIN',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '30 MIN',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '1 HR',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '5 HR',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '1 DAY',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '1 WK',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
              buttons(text: '1 MON',
                  borderColor: Colors.white,
                  bodyColor: Colors.black),
            ],
          )
        ]);
  }

}
