import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
var Adata;
var Adata2;
var Adata3;
var Adata4;
var Adata5,Adata6;


Future getData(String time)async{
  Response response = await get(Uri.parse('https://api.bottomstreet.com/api/data?page=forex_detail&filter_name=identifier&filter_value=USDJPY'));
  var data=response.body;
  var k=await jsonDecode(data)['technical_indicator']['$time'];
  Adata =k['technical_indicator'];
  Adata2=k['moving_averages']['table_data']['exponential'];
  Adata3=k['technical_indicator']['table_data'];
  Adata4=k['pivot_points']['camarilla'];
  Adata5=k['moving_averages']['text'];
  Adata6=Adata['text'];

}
void getTableData(String time,int table_index)async{
  Response response = await get(Uri.parse('https://api.bottomstreet.com/api/data?page=forex_detail&filter_name=identifier&filter_value=USDJPY'));
  var data=response.body;
  var table_data=jsonDecode(data)['technical_indicator']['$time']['technical_indicator']['table_data']['$table_index']['action'];

}
