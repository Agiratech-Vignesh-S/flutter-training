import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Settings/Account/Change_number.dart';
import 'package:whatsapp_clone/Settings/Account/Delete_my_account.dart';
import 'package:whatsapp_clone/Settings/Account/Privacy.dart';
import 'package:whatsapp_clone/Settings/Account/Request_account.dart';
import 'package:whatsapp_clone/Settings/Account/Security.dart';
import 'package:whatsapp_clone/Settings/Account/Two-step%20verification.dart';

import 'package:whatsapp_clone/settings.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Account"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
          },
        ),
      ),
      body:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Privacy()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  title: const Text(
                    "Privacy",
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Security()));
                  },
                  leading: const Icon(
                    Icons.security_sharp,
                    size: 30,
                  ),
                  title: const Text(
                    "Security",
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Two_step_verification()));
                  },
                  leading: const Icon(
                    Icons.more,
                    size: 30,
                  ),
                  title: const Text(
                    "Two-step verification",
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Change_number()));
                  },
                  leading: const Icon(
                    Icons.phonelink_ring_outlined,
                    size: 30,
                  ),
                  title: const Text(
                    "Change number",
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Request_account()));
                  },
                  leading: const Icon(
                    Icons.insert_drive_file_sharp,
                    size: 30,
                  ),
                  title: const Text(
                    "Request account info",
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Delete_my_account()));
                  },
                  leading: const Icon(
                    Icons.delete_sharp,
                    size: 30,
                  ),
                  title: const Text(
                    "Delete my account",
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
