import 'package:flutter/material.dart';
import 'package:sample/Homescreen.dart';

class secondpage extends StatelessWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("secondpage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
          },
          child: Text("Backtoscreen")
          ,
        ),
      ),
    );
  }
}
