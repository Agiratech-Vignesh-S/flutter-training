import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chat/Chat_NewMessage.dart';
import 'package:whatsapp_clone/Chat/Message_Page.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({Key? key}) : super(key: key);

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: chatdata.length,
                itemBuilder: (context,i)=>
                ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Message_Page()));
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
                  trailing: Text(chatdata[i].date),


            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat_NewMessage()));
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.chat,
        ),
      ),
    );
  }
}

class Chatlist {
  final String title;
  final String subtitle;
  final String date;
  final String pic;
  final String subtitle1;
  final Widget icon;
  final Widget icon1;
  final Widget icon2;
  final String number;

  Chatlist(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.pic,
        required this.subtitle1,
      required this.icon,
        required  this.icon1,
        required this.icon2,
        required this.number
      });
  @override
  String toString() {
    return this.title;
  }
 }

List<Chatlist> chatdata = [

  Chatlist(
      title: "Mass madhan ",
      subtitle: "Hai",
      date: "3/4/22",
      pic: 'assets/images/img.jpg',
       subtitle1: '6 October,12:09 pm ',
       icon: Icon(Icons.phone,color: Colors.green,),
       icon1: Icon(Icons.phone,color: Colors.green,),
       icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
       number: "94736 34343"
  ),
  Chatlist(
      title: "Praveen",
      subtitle: "hello",
      date: "4/6/22",
      pic: 'assets/images/Art.png',
      subtitle1: '1 October,10:09 pm ',
      icon: Icon(Icons.videocam_rounded,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
      number: "94736 39843"
  ),
  Chatlist(
      title: "vignesh",
      subtitle: "welcome",
      date: "8/5/22",
      pic: 'assets/images/flower.jpg',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
      number: "83536 34343"
  ),
  Chatlist(
      title: "mukunthan",
      subtitle: "Hai....",
      date: "3/4/22",
      pic: 'assets/images/sun.jpg',
     subtitle1: '1 October,10:09 pm ',
icon: Icon(Icons.videocam_rounded,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
      number: "94734 34343"
),
  Chatlist(
      title: "surya",
      subtitle: "hello..",
      date: "3/4/22",
      pic: 'assets/images/Art.png',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
      number: "94736 34343"
  ),
  Chatlist(
      title: "Ram",
      subtitle: "Welcome...",
      date: "3/4/22",
      pic: 'assets/images/sun.jpg',
      subtitle1: '1 October,10:09 pm ',
      icon: Icon(Icons.videocam_rounded,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
      number: "94736 39843"
  ),
  Chatlist(
      title: "Raja",
      subtitle: "Hiii....",
      date: "3/4/22",
      pic: 'assets/images/flower.jpg',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,),
      number: "94736 39843"
  ),
];
