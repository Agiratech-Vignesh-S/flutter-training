import 'package:callbackfunction/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ThirdScreen extends StatelessWidget {
  static const routeName = '/third_screen';


  @override
  Widget build(BuildContext context) {
    final val1=Provider.of<provider>(context);
    var Size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Third Screen"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/Four_screen');
          }, icon:  Icon(Icons.arrow_forward_rounded,color: Colors.cyan ,size: 30,),
          )
        ],
      ),
      body:
      // Center(
      //   child: Text(val1.count.toString(),style: const TextStyle(fontSize: 50),),
      // ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.lightGreenAccent,
              child: Text("kfhbvjef"),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.lightGreenAccent,
              child: Text("kfhbvjef"),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.lightGreenAccent,
              child: Text("kfhbvjef"),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: 200,
                  width: 25,
                  color: Colors.redAccent,
                  child: Text("kfhbvjef"),
                ),
                Container(
                  height: 200,
                  color: Colors.redAccent,
                  child: Text("gkjhbef"),
                ),
                Container(
                  height: 200,
                  color: Colors.redAccent,
                  child: Text("kvjef"),
                ),
              ],
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text("Expanded"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}