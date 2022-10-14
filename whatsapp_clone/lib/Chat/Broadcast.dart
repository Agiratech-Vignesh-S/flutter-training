import 'package:flutter/material.dart';

import 'package:whatsapp_clone/Search.dart';
import 'Chatpage.dart';

class Boradcast extends StatelessWidget {
  const Boradcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select contact"),
            const Text("7 contacts",style: TextStyle(fontSize: 10),)
          ],
        ),
        backgroundColor: Colors.green,
        leading: IconButton(icon:const Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Search()));
          }, icon: const Icon(Icons.search,size: 26,)),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              height: 100,
              child: FittedBox(
                child: Center(
                  child: Column(
                    children: [
                      Text("Only contacts with +91 98443 24553 in their address book.will",style: TextStyle(fontSize: 15),),
                      Text("recevie your broadcast messages.",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chatdata.length,
                  itemBuilder: (context,i)=>
                      ListTile(
                        onTap: (){
                        },
                        leading: Container(
                          height: 100,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(chatdata[i].pic),
                          ),
                        ),
                        title: Text(chatdata[i].title),
                        subtitle: Text(chatdata[i].subtitle),
                      )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_calls()));
        },
        backgroundColor: Colors.green,
        child: Icon( Icons.arrow_forward_rounded ,color: Colors.white,),
      ),
    );
  }
}
