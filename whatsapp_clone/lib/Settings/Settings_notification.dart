import 'package:flutter/material.dart';
import 'package:whatsapp_clone/List/Vibrate.dart';

import 'package:whatsapp_clone/settings.dart';

class Settings_notification extends StatefulWidget {
  @override
  State<Settings_notification> createState() => _Settings_notificationState();
}

class _Settings_notificationState extends State<Settings_notification> {
  bool tag3 = false;
  bool tag2 = false;
  bool tag1 = false;

  String? result = "off";

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
            Container(
              height: 200,
              width: 270,
              child: ListView.builder(
                  itemCount: Vibrate_value.length,
                  itemBuilder: (context, v) =>

                      RadioListTile(
                          title: Text(
                            Vibrate_value[v].title,
                          ),
                          value: Vibrate_value[v].title,
                    groupValue: result,
                      onChanged: (value) {Navigator.pop(context);Changes(value);}),
              ),
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
                "Calls",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const ListTile(
              title: Text("Ringtone"),
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
          ],
        ),
      ),
    );
  }
}

