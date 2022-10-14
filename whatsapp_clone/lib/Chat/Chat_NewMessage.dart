import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chat/New_group.dart';
import 'package:whatsapp_clone/Search.dart';
import 'Chatpage.dart';

class Chat_NewMessage extends StatelessWidget {
  const Chat_NewMessage({Key? key}) : super(key: key);

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

          PopupMenuButton(
              onSelected: (value){

              },
              icon: const Icon(Icons.more_vert_outlined),
              iconSize: 30,
              itemBuilder:(context)=> [
                const PopupMenuItem(
                  value: 1,
                  child: Text("invite a friend",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text("contacts",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text("Refresh",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text("",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),

              ]
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => New_group()));
              },
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                    child: Icon(Icons.people,size: 26,color: Colors.white,)),
                title: Text("New group"),
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Center(child: Icon(Icons.person_add,size: 26,color: Colors.white,))),
              title: Text("New contact"),
              trailing: Icon(Icons.qr_code,size: 30,),
            ),
            const ListTile(
              title: Text("Contacts on whatsApp"),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chatdata.length,
                  itemBuilder: (context,i)=>
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
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
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
