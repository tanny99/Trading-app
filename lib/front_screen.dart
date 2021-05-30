import 'dart:io';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'DropDownButton.dart';
import 'slider.dart';
import 'buttons.dart';
import 'tables.dart';
import 'brain.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'datamangement.dart';
class front_screen extends StatefulWidget {
  @override
  _front_screenState createState() => _front_screenState();
}



class _front_screenState extends State<front_screen> {



  // StringProvider aa;

bool isloading=false;
@override
  void initState() {

    // sleep(duration)

    super.initState();
    asd();
  }
  void asd()async{
  final a1=Provider.of<Updateprovider>(context,listen: false).a1;
  final a2=Provider.of<Updateprovider>(context,listen: false).a2;
  final a3=Provider.of<Updateprovider>(context,listen: false).a3;
  setState(() {
    isloading=true;
  });
  await Provider.of<Updateprovider>(context,listen: false).getData(a1, a2, a3);
  setState(() {
    isloading=false;
  });

  }

  @override
  Widget build(BuildContext context) {



    // print('${Adata['buy']}');
    return Scaffold(
      backgroundColor: Colors.black,
        body:isloading?Center(child:SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,
        )): Consumer<Updateprovider>(

          builder: (context,updateprovider, snapshot) {
            return Column(
              children: [
                AppBar(

                leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){}),
                title: Text('INR/USD',style: TextStyle(fontSize: 21)),
                backgroundColor: Colors.black,

              ),


                  dropdownbox(text: 'Technical Indicators',Width: 326,),

                Flexible(
                  child: ListView(
                    children: [

                      Column(
                        children: [
                          Container(
                            width: 328,
                            height: 48,
                            child: Center(child: Text('Summary',style: TextStyle(fontSize: 16,color: Color(0xffDEDEDE)),)),
                          )
                        ],
                      ),



                      ColorPicker(width:200,time:updateprovider.timex),


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
                      Center(child: buttons(text: updateprovider.Adata5, bodyColor: Colors.blue,borderColor: Colors.blue,)),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 2),
                                Text('${updateprovider.Adata['buy']}',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2),
                                Text('Buy',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2)
                              ],
                            ),
                            SizedBox(width: Responsive.width(30, context),),
                            Column(

                              children: [
                                SizedBox(height: 2),
                                Text('${updateprovider.Adata['neutral']}',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2),
                                Text('Neutral',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2),
                              ],
                            ),
                            SizedBox(width: Responsive.width(30, context),),
                            Column(

                              children: [
                                SizedBox(height: 2),
                                Text('${updateprovider.Adata['sell']}',style: TextStyle(fontSize: 18),),
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
                      table1(text1: 'MA5',text2: '${updateprovider.Adata2[0]['value']}',text3: '${updateprovider.Adata2[0]['type']}',color: Colors.red,),
                      table1(text1: 'MA10',text2: '${updateprovider.Adata2[1]['value']}',text3: '${updateprovider.Adata2[1]['type']}',color: Colors.red,),
                      table1(text1: 'MA20',text2: '${updateprovider.Adata2[2]['value']}',text3: '${updateprovider.Adata2[2]['type']}',color: Colors.blue,),
                      table1(text1: 'MA50',text2: '${updateprovider.Adata2[3]['value']}',text3: '${updateprovider.Adata2[3]['type']}',color: Colors.blue,),
                      table1(text1: 'MA100',text2: '${updateprovider.Adata2[4]['value']}',text3: '${updateprovider.Adata2[4]['type']}',color: Colors.red,),
                      table1(text1: 'MA200',text2: '${updateprovider.Adata2[5]['value']}',text3: '${updateprovider.Adata2[5]['type']}',color: Colors.blue,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: Container(height: 48,width: 328,child: Center(child: Text('Technical Indicators',style:TextStyle(fontSize: 16)))),
                      ),
                      Center(child: buttons(text: '${updateprovider.Adata6}', bodyColor: Colors.blue,borderColor: Colors.blue,)),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 2),
                                Text('${updateprovider.Adata['buy']}',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2),
                                Text('Buy',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2)
                              ],
                            ),
                            SizedBox(width: Responsive.width(30, context),),
                            Column(

                              children: [
                                SizedBox(height: 2),
                                Text('${updateprovider.Adata['neutral']}',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2),
                                Text('Neutral',style: TextStyle(fontSize: 18),),
                                SizedBox(height: 2),
                              ],
                            ),
                            SizedBox(width: Responsive.width(30, context),),
                            Column(

                              children: [
                                SizedBox(height: 2),
                                Text('${updateprovider.Adata['sell']}',style: TextStyle(fontSize: 18),),
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
                      table2(text1: 'RSI',text2: '${updateprovider.Adata3[0]['value']}',text3: '${updateprovider.Adata3[0]['action']}',color: Colors.yellow,),
                      table2(text1: 'STOCH (9,6)',text2: '${updateprovider.Adata3[1]['value']}',text3: '${updateprovider.Adata3[1]['action']}',color: Colors.red,),
                      table2(text1: 'STOCHRSI (14)',text2: '${updateprovider.Adata3[2]['value']}',text3: '${updateprovider.Adata3[2]['action']}',color: Colors.red,),
                      table2(text1: 'MACD (12,26)',text2: '${updateprovider.Adata3[3]['value']}',text3: '${updateprovider.Adata3[3]['action']}',color: Colors.blue,),
                      table2(text1: 'ADX (14)',text2: '${updateprovider.Adata3[4]['value']}',text3: '${updateprovider.Adata3[4]['action']}',color: Colors.red,),
                      table2(text1: 'Williams %R',text2: '${updateprovider.Adata3[5]['value']}',text3: '${updateprovider.Adata3[5]['action']}',color: Colors.red,),
                      table2(text1: 'CCI (14)',text2: '${updateprovider.Adata3[6]['value']}',text3: '${updateprovider.Adata3[6]['action']}',color: Colors.red,),
                      table2(text1: 'ATR (14)',text2: '${updateprovider.Adata3[7]['value']}',text3: '${updateprovider.Adata3[7]['action']}',color: Colors.red,),
                      table2(text1: 'High/Lows (14)',text2: '${updateprovider.Adata3[8]['value']}',text3: '${updateprovider.Adata3[8]['action']}',color: Colors.red,),
                      table2(text1: 'Ultimate Oscillator',text2: '${updateprovider.Adata3[9]['value']}',text3: '${updateprovider.Adata3[9]['action']}',color: Colors.red,),
                      table2(text1: 'ROC',text2:'${updateprovider.Adata3[10]['value']}',text3: '${updateprovider.Adata3[10]['action']}',color: Colors.red,),
                      table2(text1: 'Bull/Bear Power (13)',text2:'${updateprovider.Adata3[11]['value']}',text3: '${updateprovider.Adata3[11]['action']}',color: Color(0xff595959),),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: Container(height: 48,width: 328,child: Center(child: Text('Pivot Points',style:TextStyle(fontSize: 16)))),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 16),
                            child: dropdownbox3(text: 'Classic',Width:118 ),
                          )
                        ],
                      ),
                      table3(text1: 'S3',text2: '${updateprovider.Adata4['s3']}',),
                      table3(text1: 'S2',text2: '${updateprovider.Adata4['s2']}',),
                      table3(text1: 'S1',text2: '${updateprovider.Adata4['s1']}',),
                      table3(text1: 'Pivot Points',text2: '${updateprovider.Adata4['pivot_points']}',),
                      table3(text1: 'R1',text2: '${updateprovider.Adata4['r1']}',),
                      table3(text1: 'R2',text2: '${updateprovider.Adata4['r2']}',),
                      table3(text1: 'R3',text2: '${updateprovider.Adata4['r3']}',),



                    ],
                  ),
                ),
              ]
            );
          }
        ),

    );
  }
}
