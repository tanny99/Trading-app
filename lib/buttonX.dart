import 'package:flutter/material.dart';
import 'front_screen.dart';
import 'dart:io';
import 'brain.dart';
class buttonsX extends StatefulWidget {
  final String time;
  final String text;
  final Color bodyColor;
  final Color borderColor;

  buttonsX({@required this.text,@required this.borderColor,@required this.bodyColor,@required this.time});



  @override

  _buttonsXState createState() => _buttonsXState();

}

class _buttonsXState extends State<buttonsX> {

  @override

  int x=1;
  Widget build(BuildContext context) {


    List<Color> aa=[Colors.white,Colors.grey];
    return  RawMaterialButton (



      child: Text(widget.text),
      fillColor: widget.bodyColor,
      elevation: 0.0,
      highlightElevation: 0.0,
      onPressed: (){

          setState(() {


            if(x==0){
              x=1;
              getData(widget.time);

            }
            else{
              x=0;
              getData(widget.time);


            }


          });

        print(x);
          Navigator.push(
            context,
              PageRouteBuilder(
              pageBuilder: (_, __, ___) => front_screen(),
        transitionDuration: Duration(microseconds: 0),
        ),);
      } ,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: aa[x])),

      //
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
    );
  }
}

