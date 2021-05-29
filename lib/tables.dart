import 'package:flutter/material.dart';

class table1 extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color color;
  table1({@required this.text1,@required this.text2,@required this.text3,@required this.color});
  @override
  Widget build(BuildContext context) {
    List<MaterialColor> cc=[Colors.red,Colors.blue];
    int i=0;
    if(text3=='Sell'){
      i=0;
    }
    else{
      i=1;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 8,top: 8,bottom: 8),
          child: Table(
            children: [
              TableRow(
                children: [
                  Text(text1,textAlign: TextAlign.left,),
                  Text(text2,textAlign: TextAlign.center,),
                  Text(text3,style: TextStyle(color: cc[i]),textAlign: TextAlign.right,)
                ]
              )


            ],
          ),
        ),
      ),
    );
  }
}
class table2 extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color color;
  table2({@required this.text1,@required this.text2,@required this.text3,@required this.color});
  @override
  Widget build(BuildContext context) {
    List<MaterialColor> cc=[Colors.red,Colors.blue,Colors.yellow,Colors.grey];
    int i=0;
    if(text3=='Sell'){
      i=0;
    }
    else if(text3=='Buy'){
      i=1;
    }
    else if(text3=='Neutral'){
      i=2;
    }
    else{
      i=3;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 8,top: 8,bottom: 8),
          child: Table(
            children: [
              TableRow(
                  children: [
                    Opacity(opacity: 0.6,child: Text(text1,textAlign: TextAlign.left,)),
                    Text(text2,textAlign: TextAlign.center,),
                    Text(text3,textAlign: TextAlign.right,style: TextStyle(color: cc[i]),)
                  ]
              )


            ],
          ),
        ),
      ),
    );
  }
}
class table3 extends StatelessWidget {
  final String text1;
  final String text2;

  table3({@required this.text1,@required this.text2});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 8,top: 8,bottom: 8),
          child: Table(
            children: [
              TableRow(
                  children: [
                    Opacity(opacity: 0.6,child: Text(text1,textAlign: TextAlign.left,)),
                    Text('',textAlign: TextAlign.center,),
                    Text(text2,textAlign: TextAlign.right,),

                  ]
              )


            ],
          ),
        ),
      ),
    );
  }
}
