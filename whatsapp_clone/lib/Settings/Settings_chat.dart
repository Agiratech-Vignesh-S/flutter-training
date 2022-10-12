import 'package:flutter/material.dart';

import 'package:whatsapp_clone/settings.dart';



class Settings_chat extends StatefulWidget {
  @override
  State<Settings_chat> createState() => _Settings_chatState();
}
class _Settings_chatState extends State<Settings_chat> {
  bool tag1=false;
  bool tag2=false;
  bool tag3=false;


  dynamic? result ="small";

  void Changes(dynamic? value){
    setState(() {
      print("vdz");
      result=value;
    });
  }

  // double? fontsize=10;
  // double? font(){
  //   print(result);
  //   if(result=="small"){
  //     print("vfvsdvdf");
  //     fontsize=10;
  //   }
  //   else if(result =="medium"){
  //     print("vfvsdv");
  //     fontsize=25;
  //   }else{
  //     print("fvdsd");
  //     fontsize=35;
  //   }
  //   return fontsize;
  // }




  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Font size'),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap:()=> Navigator.pop(context),
                  title: Text("small"),
                    leading: Radio(value: "Small", groupValue: result, onChanged: (value)=>Changes(value))),
                SizedBox(width: 10.0,),
                ListTile(
                    onTap:()=> Navigator.pop(context),
                  title: Text("medium"),
                    leading: Radio(value: "Medium", groupValue: result, onChanged: (value)=>Changes(value))),
                SizedBox(width: 10.0,),
                ListTile(
                    onTap:()=> Navigator.pop(context),
                  title: Text("Large"),
                    leading: Radio(value: "Large", groupValue: result, onChanged: (value)=>Changes(value))),
                SizedBox(width: 10.0,),


              ],
            )
          ],

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Chats"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            width: double.infinity,
            height: 40,
            child: Text("Display",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(
                    Icons.brightness_medium,
                    size: 30,
                  ),
                  title: const Text(
                    "Theme",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Dark"),
                ),

              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(
                    Icons.wallpaper_sharp,
                    size: 30,
                  ),
                  title: const Text(
                    "Wallpaper",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),

              ),

            ],
          ),
          Divider(height: 3,),
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            width: double.infinity,
            height: 40,
            child: Text("Chat Settings",style: TextStyle(fontSize: 15),),
          ),
        SwitchListTile(value:tag1,
          onChanged: (value){
            setState(() => tag1 = value);
          },
          activeColor: Colors.green,
          secondary: Container(
            //color: Colors.white,
            width: 40,
            height: 30,
          ),
          title: Text("Enter is send",style: TextStyle(fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black),),
        subtitle: Text("Enter key will send your message"),


        ),
          SwitchListTile(value:tag2,
            onChanged: (value){
              setState(() => tag2 = value);
            },
            activeColor: Colors.green,
            secondary: Container(
              //color: Colors.white,
              width: 40,
              height: 30,
            ),
            title: Text("Media visibility",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
            subtitle: Text("show newly downloanded media in your device's "),


          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () => _dialogBuilder(context),
                  leading: Container(
                    width: 40,
                    height: 30,
                  ),
                  title: const Text(
                    "Font size",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: RichText(
                    text: TextSpan
                      (text: ('$result').toString(),style: TextStyle(fontSize:15,color: Colors.black,)),
                  ),
                ),
      ),
            ],
          ),
          Divider(height: 3,),
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            width: double.infinity,
            height: 40,
            child: Text("Archived chats",style: TextStyle(fontSize: 15),),
          ),
          SwitchListTile(value:tag3,
            onChanged: (value){
              setState(() => tag3 = value);
            },
            activeColor: Colors.green,
            secondary: Container(
              //color: Colors.white,
              width: 40,
              height: 30,
            ),
            title: Text("Keep chats archived",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
            subtitle: Text("Archived chats will remain archived when you recevie a new message"),


          ),
          Divider(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(
                    Icons.cloud_upload_sharp,
                    size: 30,
                  ),
                  title: const Text(
                    "Chat backup",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),

              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(
                    Icons.history,
                    size: 30,
                  ),
                  title: const Text(
                    "Chat histroy",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),

              ),

            ],
          ),


        ],
      ),
    );
  }
}




