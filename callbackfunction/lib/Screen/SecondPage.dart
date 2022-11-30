import 'package:callbackfunction/Screen/Thirdpage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const routeName = '/second_screen';
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen"),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).pushNamed('/third_screen');
        }, icon: Icon(Icons.arrow_forward_rounded))
      ],
      ),
      body:
        Center(
          child:Text("Second Screen"),
        )

    );
  }
}