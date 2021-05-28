import 'package:flutter/material.dart';
class buttons extends StatelessWidget {
  final String text;
  final Color bodyColor;
  final Color borderColor;
  buttons({@required this.text,@required this.borderColor,@required this.bodyColor});
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton (

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: borderColor)),
      child: Text(text),
      fillColor: bodyColor,
      elevation: 0.0,
      highlightElevation: 0.0,
      onPressed: (){} ,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

