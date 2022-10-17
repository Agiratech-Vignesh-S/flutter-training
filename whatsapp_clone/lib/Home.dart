import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Calls/Calls.dart';
import 'package:whatsapp_clone/Chat/Linked_devices.dart';
import 'package:whatsapp_clone/Chat/New_group.dart';
import 'package:whatsapp_clone/Chat/Payments.dart';
import 'package:whatsapp_clone/Chat/Starred_messages.dart';
import 'package:whatsapp_clone/Search.dart';
import 'package:whatsapp_clone/Status/Status_privacy.dart';
import 'package:whatsapp_clone/Status/Status.dart';
import 'package:whatsapp_clone/settings.dart';
import 'Chat/Chatpage.dart';
import 'package:whatsapp_clone/Chat/Broadcast.dart';


class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  int? currentindex =1;
  void popupmenu(int value) {
    switch (value) {
      case 1:
        {
          setState((){
            currentindex=1;
          });

        }
        break;
      case 2:
        {
          setState((){
            currentindex=2;
          });
        }
        break;
      case 3:
        {
          setState((){
            currentindex=3;
          });
        }
        break;
    }
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.green,
            title: const Text("WhatsApp"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                },
              ),

              currentindex ==1 ?  PopupMenuButton
                (
                  onSelected: (value) {
                    if (value == 6) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Settings()));
                    }else if(value==1){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const New_group()));
                    }else if(value==2){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Boradcast()));
                    }else if(value==3){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Linked_devices()));
                    }else if(value==4){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Starred_messages()));
                    }else if(value==5){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Payments()));
                    }
                  },
                  icon: const Icon(Icons.more_vert),
                  elevation: 10,
                  iconSize: 28,
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text(
                        "New group",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text(
                        "New broadcast",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text(
                        "Linked devices",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 4,
                      child: Text(
                        "Starred messages",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 5,
                      child: Text(
                        "Payments",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem(
                        value: 6,
                        child: GestureDetector(
                          child: const Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        onTap: () {
                          //print("tab");
                        })
                  ],
                ):currentindex ==2 ?
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 2) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const Settings()));
                  }else{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>  Status_privacy()));
                  }
                },
                icon: const Icon(Icons.more_vert),
                elevation: 10,
                iconSize: 28,
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Status privacy",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                      value: 2,
                      child: GestureDetector(
                        child: const Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {
                        //print("tab");
                      })
                ],
              ):
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 2) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const Settings()));
                  }else{
                    print("cdsv");
                    dialogBuilder(context);
                  }
                },
                icon: const Icon(Icons.more_vert),
                elevation: 10,
                iconSize: 28,
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Clear call log",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                      value: 2,
                      child: GestureDetector(
                        child: const Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {
                        //print("tab");
                      })
                ],
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                color: Colors.green,
                child: TabBar(
                  onTap: (value) => popupmenu(value),
                  //controller: null,
                  isScrollable: true,

                  indicatorColor: Colors.white,
                  indicatorWeight: 4,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  tabs: [
                    Container(
                        child: const Tab(
                      icon: Icon(Icons.camera_alt),
                    )),
                    Container(
                      width: 80,
                      child: const Tab(
                        child: Text(
                          "CHATS",
                        ),
                      ),
                    ),
                    Container(
                        width: 80,
                        child: const Tab(
                          child: Text(
                            "STATUS",
                          ),
                        )),
                    Container(
                        width: 85,
                        child: const Tab(
                          child: Text(
                            "CALLS",
                          ),
                        )),
                  ],
                ),
              ),
              Flexible(
                  flex: 2,
                  child: TabBarView(
                    children: [
                      Container(
                        color: Colors.black,
                      ),
                      Chatpage(),
                      const Status(),
                      Calls(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        content: Text('Do you want clear your entire call log? ',style: TextStyle(fontSize: 15),),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('CANCEL',style: TextStyle(color: Colors.green),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('OK',style: TextStyle(color: Colors.green),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


