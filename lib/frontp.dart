import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'DropDownButton.dart';
import 'slider.dart';
import 'buttons.dart';
import 'tables.dart';
import 'brain.dart';
class front_screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getData('1min');
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          AppBar(

            leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){}),
            title: Text('USD/INR',style: TextStyle(fontSize: 21)),
            backgroundColor: Colors.black,

          ),

          Column(children: [
            dropdownbox(text: 'Technical Indicators',Width: 326,),
          ],),
          Column(
            children: [
              Container(
                width: 328,
                height: 48,
                child: Center(child: Text('Summary',style: TextStyle(fontSize: 16,color: Color(0xffDEDEDE)),)),
              )
            ],
          ),

          ColorPicker(width: 200,time: '1min',),


          SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(
              width: 328,
              height: 48,
              child: Center(child: Text('Moving Averages')),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 170.0,right: 170),
            child: buttons(text: 'BUY', bodyColor: Colors.blue,borderColor: Colors.blue,),

          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 2),
                    Text('7',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                    Text('Buy',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2)
                  ],
                ),
                SizedBox(width: Responsive.width(30, context),),
                Column(

                  children: [
                    SizedBox(height: 2),
                    Text('-',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                    Text('Neutral',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                  ],
                ),
                SizedBox(width: Responsive.width(30, context),),
                Column(

                  children: [
                    SizedBox(height: 2),
                    Text('5',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                    Text('Sell',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: dropdownbox2(text: 'Exponential',Width:118 ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 8,top: 8,bottom: 8),
                child: Table(
                  children: [
                    TableRow(children: [Opacity(opacity:0.6,child: Text('Period',textAlign: TextAlign.left,)),Opacity(opacity:0.6,child: Text('Value',textAlign: TextAlign.center,)),Opacity(opacity:0.6,child: Text('Type',textAlign: TextAlign.right,))]),

                  ],
                ),

              ),
            ),
          ),
          table1(text1: 'MA5',text2: '465.28',text3: 'Sell',color: Colors.red,),
          table1(text1: 'MA10',text2: '465.28',text3: 'Sell',color: Colors.red,),
          table1(text1: 'MA20',text2: '465.28',text3: 'Buy',color: Colors.blue,),
          table1(text1: 'MA50',text2: '465.28',text3: 'Buy',color: Colors.blue,),
          table1(text1: 'MA100',text2: '465.28',text3: 'Sell',color: Colors.red,),
          table1(text1: 'MA200',text2: '465.28',text3: 'Buy',color: Colors.blue,),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(height: 48,width: 328,child: Center(child: Text('Technical Indicators',style:TextStyle(fontSize: 16)))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150.0,right: 150),
            child: buttons(text: 'STRONG SELL', borderColor: Color(0xffFF2E50), bodyColor:  Color(0xffFF2E50)),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 2),
                    Text('1',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                    Text('Buy',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2)
                  ],
                ),
                SizedBox(width: Responsive.width(30, context),),
                Column(

                  children: [
                    SizedBox(height: 2),
                    Text('1',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                    Text('Neutral',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                  ],
                ),
                SizedBox(width: Responsive.width(30, context),),
                Column(

                  children: [
                    SizedBox(height: 2),
                    Text('1',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                    Text('Sell',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 8,top: 8,bottom: 8),
                child: Table(
                  children: [
                    TableRow(children: [Opacity(opacity:0.6,child: Text('Name',textAlign: TextAlign.left,)),Opacity(opacity:0.6,child: Text('Value',textAlign: TextAlign.center,)),Opacity(opacity:0.6,child: Text('Action',textAlign: TextAlign.right,))]),

                  ],
                ),
              ),
            ),
          ),
          table2(text1: 'RSI',text2: '-53.6549',text3: 'Neutral',color: Colors.yellow,),
          table2(text1: 'STOCH (9,6)',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'STOCHRSI (14)',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'MACD (12,26)',text2: '-53.6549',text3: 'Buy',color: Colors.blue,),
          table2(text1: 'ADX (14)',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'Williams %R',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'CCI (14)',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'ATR (14)',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'High/Lows (14)',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'Ultimate Oscillator',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'ROC',text2: '-53.6549',text3: 'Sell',color: Colors.red,),
          table2(text1: 'Bull/Bear Power (13)',text2: '-53.6549',text3: 'Less Volatile',color: Color(0xff595959),),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(height: 48,width: 328,child: Center(child: Text('Pivot Points',style:TextStyle(fontSize: 16)))),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: dropdownbox2(text: 'Classic',Width:118 ),
              )
            ],
          ),
          table3(text1: 'S3',text2: '456.87',),
          table3(text1: 'S2',text2: '456.87',),
          table3(text1: 'S1',text2: '456.87',),
          table3(text1: 'Pivot Points',text2: '456.87',),
          table3(text1: 'R1',text2: '456.87',),
          table3(text1: 'R2',text2: '456.87',),
          table3(text1: 'R3',text2: '456.87',),



        ],
      ),
    );
  }
}
