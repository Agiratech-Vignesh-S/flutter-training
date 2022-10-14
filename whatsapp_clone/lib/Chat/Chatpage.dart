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
                        context, MaterialPageRoute(builder: (context) => Message_page()));
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

  Chatlist(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.pic,
        required this.subtitle1,
      required this.icon,
        required  this.icon1,
        required this.icon2

      });
}
List<Chatlist> chatdata = [

  Chatlist(
      title: "Person 1",
      subtitle: "Person 1",
      date: "3/4/22",
      pic: 'assets/images/img.jpg',
       subtitle1: '6 October,12:09 pm ',
       icon: Icon(Icons.phone,color: Colors.green,),
       icon1: Icon(Icons.phone,color: Colors.green,),
       icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
  ),
  Chatlist(
      title: "Person 2",
      subtitle: "Person 2",
      date: "4/6/22",
      pic: 'assets/images/Art.png',
      subtitle1: '1 October,10:09 pm ',
      icon: Icon(Icons.videocam_rounded,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
  ),
  Chatlist(
      title: "Person 3",
      subtitle: "Person 3",
      date: "8/5/22",
      pic: 'assets/images/flower.jpg',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
  ),
  Chatlist(
      title: "Person 4",
      subtitle: "Person 4",
      date: "3/4/22",
      pic: 'assets/images/sun.jpg',
     subtitle1: '1 October,10:09 pm ',
icon: Icon(Icons.videocam_rounded,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
),
  Chatlist(
      title: "Person 5",
      subtitle: "Person 5",
      date: "3/4/22",
      pic: 'assets/images/Art.png',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
  ),
  Chatlist(
      title: "Person 6",
      subtitle: "Person 6",
      date: "3/4/22",
      pic: 'assets/images/sun.jpg',
      subtitle1: '1 October,10:09 pm ',
      icon: Icon(Icons.videocam_rounded,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
  ),
  Chatlist(
      title: "Person 7",
      subtitle: "Person 7",
      date: "3/4/22",
      pic: 'assets/images/flower.jpg',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone,color: Colors.green,),
      icon1: Icon(Icons.phone,color: Colors.green,),
      icon2: Icon(Icons.videocam_rounded,color: Colors.green,)
  ),
];
