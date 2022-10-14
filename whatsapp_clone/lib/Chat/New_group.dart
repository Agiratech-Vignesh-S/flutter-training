import 'package:flutter/material.dart';

import 'package:whatsapp_clone/Search.dart';
import 'Chatpage.dart';

class New_group extends StatelessWidget {
  const New_group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("New group"),
            SizedBox(height: 2,),
            const Text("Add participants",style: TextStyle(fontSize: 10),)
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

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
