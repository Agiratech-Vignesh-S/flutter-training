import 'package:flutter/material.dart';

class Two_step_verification extends StatelessWidget {
  const Two_step_verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Two-step-verification"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
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
                    Icons.more,size: 55,color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: Text("For added security,enable two-step verification,which will require a PIN when reqistering your phone number with WhatsApp again",textAlign: TextAlign.center),
          ),

            SizedBox(height: 300,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: (){}, child: Text("ENABLE"),)

        ],),
      ),
    );
  }
}
