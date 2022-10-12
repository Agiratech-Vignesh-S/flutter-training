import 'package:flutter/material.dart';

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
        onPressed: () {},
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

  Chatlist(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.pic,
        required this.subtitle1,
      required this.icon,});
}

List<Chatlist> chatdata = [
  Chatlist(
      title: "Person 1",
      subtitle: "type.....",
      date: "3/4/22",
      pic: 'assets/images/img.jpg',
       subtitle1: '6 October,12:09 pm ',
       icon: Icon(Icons.phone)
  ),


  Chatlist(
      title: "Person 2",
      subtitle: "type.....",
      date: "4/6/22",
      pic: 'assets/images/Art.png',
      subtitle1: '1 October,10:09 pm ',
      icon: Icon(Icons.videocam_rounded)
  ),
  Chatlist(
      title: "Person 3",
      subtitle: "type.....",
      date: "8/5/22",
      pic: 'assets/images/flower.jpg',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone)
  ),
  Chatlist(
      title: "Person 4",
      subtitle: "type.....",
      date: "3/4/22",
      pic: 'assets/images/sun.jpg',
     subtitle1: '1 October,10:09 pm ',
icon: Icon(Icons.videocam_rounded)
),
  Chatlist(
      title: "Person 5",
      subtitle: "type.....",
      date: "3/4/22",
      pic: 'assets/images/Art.png',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone)),
  Chatlist(
      title: "Person 6",
      subtitle: "type.....",
      date: "3/4/22",
      pic: 'assets/images/sun.jpg',
      subtitle1: '1 October,10:09 pm ',
      icon: Icon(Icons.videocam_rounded)
  ),
  Chatlist(
      title: "Person 7",
      subtitle: "type.....",
      date: "3/4/22",
      pic: 'assets/images/flower.jpg',
      subtitle1: '6 October,12:09 pm ',
      icon: Icon(Icons.phone)),
];
