import 'package:callbackfunction/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ThirdScreen extends StatelessWidget {
  static const routeName = '/third_screen';


  @override
  Widget build(BuildContext context) {
    final val1=Provider.of<provider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Third Screen"),
        centerTitle: true,
      ),
      body:
      Center(
        child: Text(val1.count.toString(),style: const TextStyle(fontSize: 50),),
      ),
      // ListView(
      //   children: [
      //     Container(
      //       height: 200,
      //       color: Colors.lightGreenAccent,
      //       child: Text("kfhbvjef"),
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.lightGreenAccent,
      //       child: Text("kfhbvjef"),
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.lightGreenAccent,
      //       child: Text("kfhbvjef"),
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.lightGreenAccent,
      //       child: Text("kfhbvjef"),
      //     ),
      //
      //   ],
      // ),

    );
  }
}