import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chat/Chat_profile.dart';

class Message_page extends StatelessWidget {
  const Message_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat_profile()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/img.jpg',
                  height: 45,
                  width: 45,
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mass Madhan",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "online",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam_rounded,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                size: 30,
              )),
          PopupMenuButton(
            onSelected: (value){
              if(value==7){
                const PopupMenuItem(
                  value: 1,
                  child: Text("View contact",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                );
                const PopupMenuItem(
                  value: 2,
                  child: Text("View contact",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                );
              }
            },
            icon: const Icon(Icons.more_vert_outlined),
            iconSize: 30,
            itemBuilder:(context)=> [
              const PopupMenuItem(
              value: 1,
              child: Text("View contact",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
            ),
              const PopupMenuItem(
                value: 2,
                child: Text("Media,links,and docs",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("Search",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text("Mute notifications",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text("Disappearing messages",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),
              const PopupMenuItem(
                value: 6,
                child: Text("Wallpaper",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),
    ]
          ),
        ],
      ),
      bottomSheet: Bottumbar(),
    );
  }
}

class Bottumbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                const Icon(
                  Icons.emoji_emotions_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 190,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Transform.rotate(
                  child: const Icon(Icons.attach_file_outlined),
                  angle: pi / -4,
                ),
                // SizedBox(width: 15,),
                // Icon(Icons.currency_rupee_sharp),
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.camera_alt),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.green,
            ),
            padding: const EdgeInsets.all(5),
            child: IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
