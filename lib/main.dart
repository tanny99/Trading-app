import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'front_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: front_screen(),
    );
  }
}



