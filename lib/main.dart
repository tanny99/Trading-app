import 'package:app/front_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brain.dart';
// import 'package:provider/provider.dart';

import 'frontp.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MultiProvider(
        child: front_screen(),
        providers: [
          ChangeNotifierProvider<Updateprovider>(create: (context)=>Updateprovider()),
        ],
      ),

    );
  }
}



