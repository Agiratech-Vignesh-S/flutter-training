import 'package:flutter/material.dart';

import 'package:whatsapp_clone/settings.dart';

class Settings_storage extends StatefulWidget {

  @override
  State<Settings_storage> createState() => _Settings_storageState();
}

class _Settings_storageState extends State<Settings_storage> {
  bool tag1=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Storage and data"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Settings()));
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(
                    Icons.folder,
                    size: 30,
                  ),
                  title: const Text(
                    "Manage storage",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("443.4 MB"),
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
                    Icons.data_usage_rounded,
                    size: 30,
                  ),
                  title: const Text(
                    "Network usage",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("443.4 MB sent-8.3 GB recevied"),
                ),

              ),

            ],
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
            title: Text("Use less data for calls",style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black),),


          ),
           SizedBox(height: 20,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Media auto-download"),
               Text("Voice messages are always automatically downloaded "),
             ],
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: Container(
                    width: 30,
                    height: 40,
                  ),
                  title: const Text(
                    "When using mobile data",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("All media"),
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
                  leading: Container(
                    width: 30,
                    height: 40,
                  ),
                  title: const Text(
                    "When using mobile Wi-Fi",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("All media"),
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
                  leading: Container(
                    width: 30,
                    height: 40,
                  ),
                  title: const Text(
                    "When romaing",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("no media"),
                ),

              ),

            ],
          ),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Media upload quality"),
              Text("Choose the quality of media files to be sent"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                  },
                  leading: Container(
                    width: 30,
                    height: 40,
                  ),
                  title: const Text(
                    "photo upload quality",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Auto (recommended)"),
                ),

              ),

            ],
          ),

        ],
      ),
    );
  }
}
