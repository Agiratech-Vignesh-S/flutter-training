import 'package:flutter/material.dart';
import 'package:sample/Homescreen.dart';
import 'secondscreen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Homescreen(),
    );
  }
}
