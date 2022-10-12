import 'package:flutter/material.dart';

class Calls extends StatelessWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
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
                          backgroundImage: AssetImage(
                              'assets/images/img.jpg'),
                        )
                    ),
                  ),
                  title: const Text("Person 1",
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle:  Text("6 Outober "),
                  trailing:Icon(Icons.phone,size: 30,color: Colors.green,),
                ),
              ),
              const Divider(),
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
                          backgroundImage: AssetImage(
                              'assets/images/flower.jpg'),
                        )
                    ),
                  ),
                  title: const Text("Person 2",
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: const Text("type....."),
                  trailing: Icon(Icons.videocam_rounded,size: 30,color: Colors.green,),
                ),
              ),
              const Divider(),
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
                          backgroundImage: AssetImage(
                              'assets/images/sun.jpg'),
                        )
                    ),
                  ),
                  title: const Text("Person 3",
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: const Text("type....."),
                  trailing: Icon(Icons.phone,size: 30,color: Colors.green,),
                ),
              ),
              const Divider(),
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
                          backgroundImage: AssetImage(
                              'assets/images/Art.png'),
                        )
                    ),
                  ),
                  title: const Text("Person 4",
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: const Text("type....."),
                  trailing: Icon(Icons.videocam_rounded,size: 33,color: Colors.green,),
                ),
              ),
              const Divider(),
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
                          backgroundImage: AssetImage(
                              'assets/images/flower.jpg'),
                        )
                    ),
                  ),
                  title: const Text("Person 5",
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: const Text("type....."),
                  trailing: Icon(Icons.phone,size: 33,color: Colors.green,),
                ),
              ),
              const Divider(),
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
                          backgroundImage: AssetImage(
                              'assets/images/Art.png'),
                        )
                    ),
                  ),
                  title: const Text("Person 6",
                    style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: const Text("type....."),
                  trailing: Icon(Icons.videocam_rounded,size: 33,color: Colors.green,),
                ),
              ),
              const Divider(),
            ],
          ),
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
