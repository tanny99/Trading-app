import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'front_screen.dart';
import 'front_screen.dart' as f;
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
      onPressed: ()async{
        final a2=Provider.of<Updateprovider>(context,listen: false).a2;
        final a3=Provider.of<Updateprovider>(context,listen: false).a3;
        await Provider.of<Updateprovider>(context,listen: false).getData(widget.time,a2 , a3);
        Provider.of<Updateprovider>(context,listen: false).changea1(widget.time);
        print(widget.text);
      } ,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: aa[x])),

      //
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
    );
  }
}

