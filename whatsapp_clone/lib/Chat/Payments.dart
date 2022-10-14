import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        ) ,
        title: Text("Payments"),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.currency_rupee_outlined,color: Colors.white,)),
                  ),
                  title: Text("send payment"),
                ),
                ListTile(
                  leading: Icon(Icons.qr_code,color: Colors.green,),
                  title: Text("Scan payment QR code"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("History",style: TextStyle(color: Colors.green),),

            ),
            Container(
              width: double.infinity,
              height: 90,
              child: Center(
                child: Icon(Icons.event_note_outlined,size: 70,color: Colors.black26,),
              ),
            ),
            SizedBox(
                height: 30,
                child: Text("No payment history")),
                ]
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("Payment methods",style: TextStyle(color: Colors.green),),
                ),
                Row(
                  children: [
                    Container(
                    //  color: Colors.greenAccent,
                      width: 60,
                      height: 60,
                      child: Center(child: Icon(Icons.add_moderator)),
                    ),
                    Container(
                     // color: Colors.lightGreenAccent,
                      height: 50,
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(("To protect your security.WhatsApp does not")),
                          Text("store  your UPI PIN or full bank account number")
                        ],
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.add_circle_outline_outlined,color: Colors.black87,),
                  title: Text("add payment method"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Help"),
            ),
          )

        ],
      ),
    );
  }
}
