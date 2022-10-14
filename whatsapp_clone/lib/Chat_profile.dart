import 'package:flutter/material.dart';

class Chat_profile extends StatefulWidget {
  const Chat_profile({Key? key}) : super(key: key);

  @override
  State<Chat_profile> createState() => _Chat_profileState();
}

bool tag2=false;

class _Chat_profileState extends State<Chat_profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back,size: 28,)),
                        Center(
                          child: Container(
                            // color: Colors.cyanAccent,
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50,),
                            height: 170,
                            width: 285,
                            child: Center(
                              child: ClipRRect(
                                child: Image.asset('assets/images/img.jpg'),
                                borderRadius: BorderRadius.circular(150),
                              ),
                            ),
                          ),
                        ),
                        PopupMenuButton(
                            onSelected: (value){

                            },
                            icon: const Icon(Icons.more_vert_outlined),
                            iconSize: 30,
                            itemBuilder:(context)=> [
                              const PopupMenuItem(
                                value: 1,
                                child: Text("Share",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: Text("Edit",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              ),
                              const PopupMenuItem(
                                value: 3,
                                child: Text("View in address book.",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              ),
                              const PopupMenuItem(
                                value: 4,
                                child: Text("Verify security code",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              ),

                            ]
                        ),
                      ],
                    ),
                    const Text("Mass Madhan",style: TextStyle(fontSize: 30),),
                    const Text("+91 98746 34553"),
                    Container(
                     // color: Colors.cyanAccent,
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.phone,size: 40,color: Colors.green,),),
                          const SizedBox(width: 30,),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.videocam_rounded,size: 40,color: Colors.green,)),
                          const SizedBox(width: 30,),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                              child:
                          FittedBox(child: IconButton(onPressed: (){}, icon: const Icon(Icons.currency_rupee,size: 33,color: Colors.white,)))),
                          const SizedBox(width: 30,),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded,size: 40,color: Colors.green,)),
                        ],
                      ),
                    ),

                  ],
                ),
              ),


              const SizedBox(height: 7,),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),

                  width: double.infinity,
                  height: 65,
                  child: const Text("Hey there! I am using WhatsApp.",style: TextStyle(fontSize: 20),),
                ),
              ),
              const SizedBox(height: 7,),
              Card(
                child: Column(
                  children: [
                    SwitchListTile(value:tag2,
                      onChanged: (value){
                        setState(() => tag2 = value);
                      },
                      activeColor: Colors.green,
                      title: const Text("Mute Notificatoins",),
                      secondary: const Icon(Icons.notifications_sharp),
                    ),
                    const ListTile(
                      leading: Icon(Icons.music_note),
                      title: Text("Custom Notification"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("Media visibility"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7,),
              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text("Encryption"),
                      subtitle: Text("Message and calls are end-to-end encrypted.Tap to verify"),
                    ),
                    ListTile(
                      leading: Icon(Icons.data_usage_rounded),
                      title: Text("Disappearing messages"),
                      subtitle: Text("Off"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7,),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("No groups in common",),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.people,color: Colors.white,)),
                      title: Text("Create group with Mass Madhan"),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 7,),
              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.block,color: Colors.red,),
                      title: Text("Block Mass Madhan",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
                    ListTile(
                      leading: Icon(Icons.report ,color: Colors.red,),
                      title: Text("Report Mass Madhan",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}
