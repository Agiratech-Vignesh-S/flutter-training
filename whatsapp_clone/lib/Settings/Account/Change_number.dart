import 'package:flutter/material.dart';

class Change_number extends StatelessWidget {
  const Change_number({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Change number"),
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
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Container(
                  height: 120,
                  width: 120,
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.sim_card,size: 75,color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Text("Changing Your phone number will migrate your account info. group & settings.",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
            ),
            Container(
              height: 50,
              child: Text("Before proceeding.please confirm that you are able to receive SMS or calls at your new number.",),),

            Container(
              height: 50,
              child: Text("If you have both a new phone & a new number.first change your number on your old phone"),
            ),
            SizedBox(
              height: 230,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: (){}, child: Text("NEXT"),)

          ],
        ),
      ),
    );
  }
}
