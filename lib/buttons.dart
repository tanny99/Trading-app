import 'package:flutter/material.dart';
class buttons extends StatelessWidget {
  final String text;
  final Color bodyColor;
  final Color borderColor;
  buttons({@required this.text,@required this.borderColor,@required this.bodyColor});
  @override
  Widget build(BuildContext context) {
    List<Color> cc=[Colors.red,Colors.blue];
    int i=0;
    if(text=='Buy'||text=='Strong Buy'){
      i=1;
    }
    else{
      i=0;
    }
    return  Expanded(
      child: RawMaterialButton (

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: cc[i])),
        child: Text(text),
        fillColor: cc[i],
        elevation: 0.0,
        highlightElevation: 0.0,
        onPressed: (){

        } ,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}

