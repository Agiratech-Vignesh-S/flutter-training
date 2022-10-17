import 'package:flutter/material.dart';


import 'package:whatsapp_clone/Search.dart';
import 'package:whatsapp_clone/Chat/Chatpage.dart';

class Invite extends StatelessWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Invite a friend"),
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
            const ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Center(child: Icon(Icons.share,size: 26,color: Colors.white,))),
              title: Text("Share link"),

            ),
            const ListTile(
              title: Text("From Contacts"),
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
                        subtitle: Text(chatdata[i].number),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
