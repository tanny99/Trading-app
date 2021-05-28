import 'package:flutter/material.dart';

class dropdownbox extends StatelessWidget {
  final String text;
  final double Width;

  dropdownbox({this.text,this.Width});

  @override
  Widget build(BuildContext context) {
    return Container(decoration:BoxDecoration(
      color: Color(0xff121212),
      borderRadius: BorderRadius.circular(10.0),
    ),width: Width,height: 40,child: Padding(
      padding: const EdgeInsets.only(left: 18,top: 14),
      child: Stack(
          children: <Widget>[Text(text,style: TextStyle(fontSize: 14),),Padding(
            padding: const EdgeInsets.only(left: 270,bottom: 30),
            child: Icon(Icons.keyboard_arrow_down_outlined,size: 20,),
          )]),
    ),);
  }
}
class dropdownbox2 extends StatelessWidget {
  final String text;
  final double Width;

  dropdownbox2({this.text,this.Width});

  @override
  Widget build(BuildContext context) {
    return Container(decoration:BoxDecoration(
      color: Color(0xff121212),
      borderRadius: BorderRadius.circular(10.0),
    ),width: Width,height: 40,child: Padding(
      padding: const EdgeInsets.only(left: 18,top: 14),
      child: Stack(
          children: <Widget>[Text(text,style: TextStyle(fontSize: 14),),Padding(
            padding: const EdgeInsets.only(left: 77,bottom: 30),
            child: Icon(Icons.keyboard_arrow_down_outlined,size: 20,),
          )]),
    ),);
  }
}
