import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Settings/Help.dart';
import 'package:whatsapp_clone/Settings/Profile.dart';
import 'package:whatsapp_clone/Settings/Settings_chat.dart';
import 'package:whatsapp_clone/Settings/Settings_notification.dart';
import 'package:whatsapp_clone/Settings/Settings_storage.dart';
import 'Chats.dart';

import 'Settings/Account.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  var result = 1;
  void check(value) {
    setState(() {
      result = value;
    });
  }

  void Bottomsheet(BuildContext ctex) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: ctex,
      builder: (_) {
        return SingleChildScrollView(

          child: Container(
            height: 900,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 60,
                    height: 3,
                    decoration: const BoxDecoration(
                      border: BorderDirectional(
                          top: BorderSide(width: 5, color: Colors.grey)),
                    )),
                ListTile(
                  leading: IconButton(icon: Icon(Icons.close),onPressed: () => Navigator.of(context).pop(),),
                  title: const Text("App language"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading:Radio<dynamic>(
                    value: 1,
                    groupValue: result,
                    onChanged: (x) => check(x),
                  ),
                  title: const Text("English"),
                  subtitle: Text("phone's language"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 2, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 3, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 4, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 5, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 6, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 7, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 8, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Radio<dynamic>(
                      value: 9, groupValue: result, onChanged: (x) => check(x)),
                  title: const Text("English"),
                  onTap: () => Navigator.of(context).pop(),
                ),



              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Chats()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                  },
                  leading: Container(
                    child: ClipRRect(
                      child: Image.asset('assets/images/img.jpg'),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  title: const Text(
                    "Person 1",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Available"),
                  trailing: const Icon(
                    Icons.qr_code,
                    color: Colors.green,
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Account()));
                  },
                  leading: const Icon(
                    Icons.key,
                    size: 30,
                  ),
                  title: const Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Privacy,Security,Change number"),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings_chat()));
                  },
                  leading: const Icon(
                    Icons.chat,
                    size: 30,
                  ),
                  title: const Text(
                    "Chats",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Theme,Wallpapers,chat history"),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings_notification()));
                  },
                  leading: Icon(
                    Icons.notifications_sharp,
                    size: 30,
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Message,group & call tones"),
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
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings_storage()));
                  },
                  leading: const Icon(
                    Icons.data_usage_rounded,
                    size: 30,
                  ),
                  title: const Text(
                    "Storage and data",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Network,usage,auto_download"),
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
                  return Bottomsheet(context);
                  },
                  leading: const Icon(
                    Icons.language,
                    size: 30,
                  ),
                  title: const Text(
                    "App language",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("English (phone's languages)"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Expanded(
                child: ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    size: 30,
                  ),
                  onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>Help())),
                  title: Text(
                    "Help",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Help centre,contact us,Privacy policy"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Expanded(
                child: ListTile(
                  onTap: null,
                  leading: Icon(
                    Icons.people,
                    size: 30,
                  ),
                  title: Text(
                    "invite a friend",
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
