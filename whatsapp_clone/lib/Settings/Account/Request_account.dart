import 'package:flutter/material.dart';

class Request_account extends StatelessWidget {
  const Request_account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Request account info"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: Center(
                child: Container(

                  height: 120,
                  width: 120,
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.sticky_note_2,size: 75,color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Text("Create a report of your WhatsApp accout information and settings.which you can access or port to another app.this report does not include your messages.",style: TextStyle(fontSize: 15),),
            ),
            Divider(
              height: 3,

              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.sticky_note_2_rounded,size: 30,color: Colors.black,),
              title: Text("Request report",style: TextStyle(color: Colors.black),),
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
