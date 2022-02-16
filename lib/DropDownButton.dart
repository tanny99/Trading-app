import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brain.dart';

class dropdownbox extends StatefulWidget {
  final String text;
  final double Width;

  dropdownbox({this.text,this.Width});

  @override
  _dropdownboxState createState() => _dropdownboxState();
}

class _dropdownboxState extends State<dropdownbox> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(decoration:BoxDecoration(
      color: Color(0xff121212),
      borderRadius: BorderRadius.circular(10.0),
    ),width: Responsive.width(70, context),height: 40,child: Center(
    child: DropdownButton<String>(
      focusColor:Colors.white,
      value: _chosenValue,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor:Colors.white,
      items: <String>[

      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style:TextStyle(color:Colors.white),),
        );
      }).toList(),
      hint:Text(
        "${widget.text}",
        style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),

    ),

        ),);

  }
}
class dropdownbox2 extends StatefulWidget {
  final String text;
  final double Width;

  dropdownbox2({this.text,this.Width});

  @override
  _dropdownbox2State createState() => _dropdownbox2State();
}

class _dropdownbox2State extends State<dropdownbox2> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(decoration:BoxDecoration(
      color: Color(0xff121212),
      borderRadius: BorderRadius.circular(10.0),
    ),width: Responsive.width(70, context),height: 40,child: Center(
      child: Flexible(
        child: DropdownButton<String>(
          focusColor:Colors.white,
          value: _chosenValue,
          //elevation: 5,
          style: TextStyle(color: Colors.white),
          iconEnabledColor:Colors.white,
          items: <String>[
            'Exponential',
            'Simple',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style:TextStyle(color:Colors.white),),
            );
          }).toList(),
          hint:Text(
            "${widget.text}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          onChanged: (String value) async{
            final a1=Provider.of<Updateprovider>(context,listen: false).a1;
            final a2=Provider.of<Updateprovider>(context,listen: false).a2;
            await Provider.of<Updateprovider>(context,listen: false).getData(a1,a2 , value.toLowerCase());
            Provider.of<Updateprovider>(context,listen: false).changea3(value.toLowerCase());
            setState(() {
              _chosenValue = value;
            });
          },
        ),
      ),
    ),);
  }
}
class dropdownbox3 extends StatefulWidget {
  final String text;
  final double Width;

  dropdownbox3({this.text,this.Width});

  @override
  _dropdownbox3State createState() => _dropdownbox3State();
}

class _dropdownbox3State extends State<dropdownbox3> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(decoration:BoxDecoration(
      color: Color(0xff121212),
      borderRadius: BorderRadius.circular(10.0),
    ),width: Responsive.width(70, context),height: 40,child: Center(
      child: DropdownButton<String>(
        focusColor:Colors.white,
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(color: Colors.white),
        iconEnabledColor:Colors.white,
        items: <String>[
          'Classic',
          'Fibonacci',
          'Camarilla',
          'Woodie',
          'DeMark'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style:TextStyle(color:Colors.white),),
          );
        }).toList(),
        hint:Text(
          "${widget.text}",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        onChanged: (String value) async{
          final a1=Provider.of<Updateprovider>(context,listen: false).a1;
          final a3=Provider.of<Updateprovider>(context,listen: false).a3;
          await Provider.of<Updateprovider>(context,listen: false).getData(a1,value.toLowerCase() , a3);
           Provider.of<Updateprovider>(context,listen: false).changea2(value.toLowerCase());
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    ),);
  }
}
