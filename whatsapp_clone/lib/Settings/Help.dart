import 'package:flutter/material.dart';


import 'package:whatsapp_clone/settings.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
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
                    Icons.help_outline,
                    size: 30,
                  ),
                  title: const Text(
                    "Help Center",
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
                    Icons.people,
                    size: 30,
                  ),
                  title: const Text(
                    "Contact us",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Question? Need privacy policy"),
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
                    Icons.insert_drive_file,
                    size: 30,
                  ),
                  title: const Text(
                    "Terms and privacy policy",
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
                    Icons.info_outline,
                    size: 30,
                  ),
                  title: const Text(
                    "App info",
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
