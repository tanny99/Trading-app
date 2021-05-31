import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Updateprovider extends ChangeNotifier {
  var Adata,Adata7;
  var Adata2;
  var Adata3;
  var Adata4;
  var Adata5, Adata6;
  var timex;
  var a1='1min';
  var a2='classic';
  var a3='exponential';

  void changea1(String aa) {
      a1=aa;
  }
  void changea2(String aa) {
    a2=aa;
  }
  void changea3(String aa) {
    a3=aa;
  }

  Future getData(String time, String pivots, String ExponentialOrSimple) async {
    print(time+pivots+ExponentialOrSimple);
    Response response = await get(Uri.parse(
        'https://api.bottomstreet.com/api/data?page=forex_detail&filter_name=identifier&filter_value=USDJPY'));
    var data = response.body;
    timex = time;
    var k = await jsonDecode(data)['technical_indicator']['$time'];
    if (k != null) {
      Adata = k['moving_averages'];
      Adata7 = k['moving_averages']['neutral'];
      if(Adata7==null){
        Adata7='-';
      }
      Adata2 = k['moving_averages']['table_data']['$ExponentialOrSimple'];
      Adata3 = k['technical_indicator']['table_data'];
      Adata4 = k['pivot_points']['$pivots'];
      Adata5 = k['moving_averages']['text'];
      Adata6 = Adata['text'];

      notifyListeners();
    }
    print(data);
  }

}