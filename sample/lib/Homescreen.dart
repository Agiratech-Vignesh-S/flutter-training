import 'package:flutter/material.dart';
import 'secondscreen.dart';
class Homescreen extends StatelessWidget {
  const Homescreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(
          Icons.menu
        ),
        onPressed: (){},),
      title: Text('homescreen'),
        actions:<Widget> [
      IconButton(icon: Icon(
          Icons.menu
      ),
      onPressed: (){},
      ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>secondpage()));
          },
          child: Text("Next screen")
          ,
        ),
      ),


    );
  }
}
