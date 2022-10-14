import 'package:flutter/material.dart';

class Starred_messages extends StatelessWidget {
  const Starred_messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),),
        title: Text("Starred messages"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Container(
              height: 200,
              width: 200,
              child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.star,size: 100,color: Colors.white,)
              )
          ),
        ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
                width: 200,
                height: 80,
                child: Column(
                  children: [
                    Text("Tap and hold on any messages",style: TextStyle(fontWeight:FontWeight.w400 ),),
                    Text("any chat to star it.so you can",style: TextStyle(fontWeight:FontWeight.w400)),
                    Text(" easity find it later",style: TextStyle(fontWeight:FontWeight.w400)),
                  ],
                )),
          )
      ],),
    );
  }
}
