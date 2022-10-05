import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          title: Text("WhatsApp UI Clone"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {},),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                      Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: TextButton(child: Text("STATUS",style: TextStyle(color: Colors.white,),),onPressed: (){},),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.green,
                        child: TextButton(child: Text("STATUS",style: TextStyle(color: Colors.white,),),onPressed: (){},)
                      ),
                      Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: TextButton(child: Text("CALLS",style: TextStyle(color: Colors.white,),),onPressed: (){},)
                      ),
                    ],
            ),
      ),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(2),
                       width: 100,
                        height: 100,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img.jpg'),
                        )
                      ),
                    ),
                    title: const Text("Person 1",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("type....."),
                    trailing: const Text("3/4/22"),
                  ),
                ),
                Divider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(2),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/flower.jpg'),
                          )
                      ),
                    ),
                    title: const Text("Person 2",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("type....."),
                    trailing: const Text("5/4/22"),
                  ),
                ),
                Divider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(2),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/sun.jpg'),
                          )
                      ),
                    ),
                    title: const Text("Person 1",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("type....."),
                    trailing: const Text("3/4/22"),
                  ),
                ),
                Divider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(2),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/Art.png'),
                          )
                      ),
                    ),
                    title: const Text("Person 1",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("type....."),
                    trailing: const Text("3/4/22"),
                  ),
                ),
                Divider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(2),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/flower.jpg'),
                          )
                      ),
                    ),
                    title: const Text("Person 1",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("type....."),
                    trailing: const Text("3/4/22"),
                  ),
                ),
                Divider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(2),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/Art.png'),
                          )
                      ),
                    ),
                    title: const Text("Person 1",style: TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: const Text("type....."),
                    trailing: const Text("3/4/22"),
                  ),
                ),
                Divider(),
              ],
            ),
          ],
        ),


    ),
    );
  }
}
