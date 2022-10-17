import 'dart:io';

import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {

  bool tag2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text("Security"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.lock,size: 55,color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              child: const Text("Your chats and calls are private"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 65,
              child: const Text("End-to-end encryption keeps your personal messages amd calls between you and the people you choose.Not even whatsaoo can read or listen to them.this include your:"),
            ),
          ),
          Container(

            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.message_rounded),
                    Text("Text and voice")
                  ],
                ),Row(
                  children: const [
                    Icon(Icons.phone),
                    Text("audio and video calls")
                  ],
                ),Row(
                  children: [
                    Transform.rotate(child: const Icon(Icons.attach_file_outlined),angle: pid / -4,),
                    const Text("photos,videos and documents")
                  ],
                ),Row(
                  children: const [
                    Icon(Icons.add_location),
                    Text("Location sharing")
                  ],
                ),Row(
                  children: const [
                    Icon(Icons.update_disabled_sharp),
                    Text("Status update")
                  ],
                ),
                TextButton(onPressed: (){}, child: const Text("Learn more")),
                const Divider(height: 4,color: Colors.black)
              ],
            ),
          ),

          SwitchListTile(
            value: tag2,
            onChanged: (value) {
              setState(() => tag2 = value);
            },
            activeColor: Colors.green,
            title: const Text(
              "Read receipts",
            ),
            subtitle: const Text(
                "Get notified when your security code changes for a contact's phone in an end-to-encrypted chat. if you have multiple device.this setting must be enabled on each device where you to get notification. "),
          ),

        ],
      ),
    ),
    );
  }
}
