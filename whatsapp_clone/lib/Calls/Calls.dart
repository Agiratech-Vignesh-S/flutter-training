import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Calls/Add_calls.dart';

import '../Chat/Chatpage.dart';


class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: chatdata.length,
                itemBuilder: (context,i)=>
                    ListTile(
                      onTap: (){
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => Message_page()));
                      },
                      leading: Container(
                        height: 100,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(chatdata[i].pic),
                        ),
                      ),
                      title: Text(chatdata[i].title),
                      subtitle: Text(chatdata[i].subtitle1),
                      trailing: chatdata[i].icon1,
                    )
            ),
          )
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_calls()));
        },
        backgroundColor: Colors.green,
        child: Icon( Icons.add_ic_call ,color: Colors.white,),
      ),
    );
  }
}
