import 'package:flutter/material.dart';

import 'package:whatsapp_clone/settings.dart';

class Settings_chat extends StatefulWidget {
  @override
  State<Settings_chat> createState() => _Settings_chatState();
}

class _Settings_chatState extends State<Settings_chat> {
  bool tag1 = false;
  bool tag2 = false;
  bool tag3 = false;

  String result = "small";
  String result1 = "System defalt";

  void Changes(dynamic? value) {
    setState(() {
      result = value;
    });
  }
  void Changes1(dynamic? value) {
    setState(() {
      result1 = value;
    });
  }

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
                    onTap: () => Navigator.pop(context),
                    title: const Text("small"),
                    leading: Radio(
                      value: "Small",
                      groupValue: result,
                      onChanged: (value) {
                        Navigator.pop(context);
                        Changes(value);
                      },
                      activeColor: Colors.green,
                      hoverColor: Colors.green,
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                ListTile(
                    onTap: () => Navigator.pop(context),
                    title: const Text("medium"),
                    leading: Radio(
                        value: "Medium",
                        groupValue: result,
                        onChanged: (value) {
                          Changes(value);
                          Navigator.pop(context);
                        },
                      activeColor: Colors.green,
                      hoverColor: Colors.green,
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                ListTile(
                    onTap: () => Navigator.pop(context),
                    title: const Text("Large"),
                    leading: Radio(
                        value: "Large",
                        groupValue: result,
                        onChanged: (value) {
                          Changes(value);
                          Navigator.pop(context);
                        },
                      activeColor: Colors.green,
                      hoverColor: Colors.green,
                    )),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> dialogBuilder1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Theme"),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                    onTap: () => Navigator.pop(context),
                    title: const Text("System defalt"),
                    leading: Radio(
                      value: "System defalt",
                      groupValue: result1,
                      onChanged: (value) {
                        Navigator.pop(context);
                        Changes1(value);
                      },
                      activeColor: Colors.green,
                      hoverColor: Colors.green,
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                ListTile(
                    onTap: () => Navigator.pop(context),
                    title: const Text("Light"),
                    leading: Radio(
                        value: "Light",
                        groupValue: result1,
                        onChanged: (value) {
                          Changes1(value);
                          Navigator.pop(context);
                        },
                      activeColor: Colors.green,
                      hoverColor: Colors.green,
                        )),
                const SizedBox(
                  width: 10.0,
                ),
                ListTile(
                    onTap: () => Navigator.pop(context),
                    title: const Text("Dark"),
                    leading: Radio(
                        value: "Dark",
                        groupValue: result1,
                        onChanged: (value) {
                          Changes1(value);
                          Navigator.pop(context);
                        },
                      activeColor: Colors.green,
                      hoverColor: Colors.green,
                        )),
                const SizedBox(
                  width: 10.0,
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
        title: const Text("Chats"),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            height: 40,
            child: const Text(
              "Display",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap:()=> dialogBuilder1(context),
                  leading: const Icon(
                    Icons.brightness_medium,
                    size: 30,
                  ),
                  title: const Text(
                    "Theme",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                        text: ('$result1').toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
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
                  onTap: () {},
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
          const Divider(
            height: 3,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            height: 40,
            child: const Text(
              "Chat Settings",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SwitchListTile(
            value: tag1,
            onChanged: (value) {
              setState(() => tag1 = value);
            },
            activeColor: Colors.green,
            secondary: Container(
              //color: Colors.white,
              width: 40,
              height: 30,
            ),
            title: const Text(
              "Enter is send",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            subtitle: const Text("Enter key will send your message"),
          ),
          SwitchListTile(
            value: tag2,
            onChanged: (value) {
              setState(() => tag2 = value);
            },
            activeColor: Colors.green,
            secondary: Container(
              //color: Colors.white,
              width: 40,
              height: 30,
            ),
            title: const Text(
              "Media visibility",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black),
            ),
            subtitle: const Text("show newly downloanded media in your device's "),
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
                    text: TextSpan(
                        text: ('$result').toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 3,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            height: 40,
            child: const Text(
              "Archived chats",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SwitchListTile(
            value: tag3,
            onChanged: (value) {
              setState(() => tag3 = value);
            },
            activeColor: Colors.green,
            secondary: Container(
              //color: Colors.white,
              width: 40,
              height: 30,
            ),
            title: const Text(
              "Keep chats archived",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black),
            ),
            subtitle: const Text(
                "Archived chats will remain archived when you recevie a new message"),
          ),
          const Divider(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {},
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
                  onTap: () {},
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
