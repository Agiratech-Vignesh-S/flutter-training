import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chat/Chatpage.dart';

import 'package:whatsapp_clone/settings.dart';

class Settings_notification extends StatefulWidget {
  @override
  State<Settings_notification> createState() => _Settings_notificationState();
}

class _Settings_notificationState extends State<Settings_notification> {
  bool tag3 = false;
  bool tag2 = false;
  bool tag1 = false;

  String? result = "Off";

  void Changes(dynamic? value) {
    setState(() {
      result = value;
    });
  }

  Future<void> dialogBuilder1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Vibrate'),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ListView.builder(
                      itemCount: chatdata.length,
                      itemBuilder: (context, v) => ListTile(
                          onTap: () => Navigator.pop(context),
                          title: Text(
                            chatdata[v].title.toString(),
                          ),
                          leading: Radio(
                            value: chatdata[v].title.toString(),
                            groupValue: result,
                            onChanged: (value) {
                              Navigator.pop(context);
                              Changes(value);
                            },
                            activeColor: Colors.green,
                            hoverColor: Colors.green,
                          ))),
                ),
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
      appBar: AppBar(
        title: const Text("Notification"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Settings()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: SwitchListTile(
                value: tag3,
                onChanged: (value) {
                  setState(() => tag3 = value);
                },
                activeColor: Colors.green,
                title: const Text(
                  "Conversation tones",
                ),
                subtitle: const Text(
                    "play sounds for incoming and outgoing messages"),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: const Text(
                "Messages",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const ListTile(
              title: Text("Notification tone"),
              subtitle: Text("Default"),
            ),
             ListTile(
               onTap:()=> dialogBuilder1(context),
              title: Text("Vibrate"),
              subtitle:
              RichText(
                text: TextSpan(
                    text: ('$result').toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                ),
              ),
            ),
            const ListTile(
              title: Text("Popup notification"),
              subtitle: Text("Not avaliable"),
            ),
            const ListTile(
              title: Text("Light"),
              subtitle: Text("white"),
            ),
            SwitchListTile(
              value: tag1,
              onChanged: (value) {
                setState(() => tag1 = value);
              },
              activeColor: Colors.green,
              title: const Text(
                "Use high priority notifications",
              ),
              subtitle: const Text(
                  "show previews of notifications at the top of the scrren"),
            ),
            SwitchListTile(
              value: tag2,
              onChanged: (value) {
                setState(() => tag2 = value);
              },
              activeColor: Colors.green,
              title: const Text(
                "Reaction Notificatoins",
              ),
              subtitle: const Text(
                  "show notifications for reaction to message you send"),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: const Text(
                "Groups",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const ListTile(
              title: Text("Notification tone"),
              subtitle: Text("Default"),
            ),
            const ListTile(
              title: Text("Vibrate"),
              subtitle: Text("Off"),
            ),
            const ListTile(
              title: Text("Popup notification"),
              subtitle: Text("Not avaliable"),
            ),
            const ListTile(
              title: Text("Light"),
              subtitle: Text("white"),
            ),
            SwitchListTile(
              value: tag1,
              onChanged: (value) {
                setState(() => tag1 = value);
              },
              activeColor: Colors.green,
              title: const Text(
                "Use high priority notifications",
              ),
              subtitle: const Text(
                  "show previews of notifications at the top of the scrren"),
            ),
            SwitchListTile(
              value: tag2,
              onChanged: (value) {
                setState(() => tag2 = value);
              },
              activeColor: Colors.green,
              title: const Text(
                "Reaction Notificatoins",
              ),
              subtitle: const Text(
                  "show notifications for reaction to message you send"),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: const Text(
                "Calls",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const ListTile(
              title: Text("Ringtone"),
              subtitle: Text("Default"),
            ),
            const ListTile(
              title: Text("Vibrate"),
              subtitle: Text("Off"),
            ),
          ],
        ),
      ),
    );
  }
}

class Vibrate {
  final String title;

  Vibrate(this.title);

  List<Vibrate> chatdata1 = [
    Vibrate(
      "OFF",
    ),
    Vibrate(
      "Defalut",
    ),
    Vibrate(
      "short",
    ),
    Vibrate(
      "Long",
    ),
  ];
}
