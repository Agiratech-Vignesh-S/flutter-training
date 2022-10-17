import 'package:flutter/material.dart';

class Status_privacy extends StatefulWidget {
  @override
  State<Status_privacy> createState() => _Status_privacyState();
}

class _Status_privacyState extends State<Status_privacy> {
var result=1;

void Changes(dynamic? value){
  setState(() {
    print("vdz");
    result=value;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(backgroundColor: Colors.green,
             title: Text("Status privacy"),
             leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
              Navigator.pop(context);
  },),
),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,top: 20),
            width: double.infinity,
            height: 45,
            child: Text("who can see my status updates"),
          ),
          ListTile(
              title: Text("My contacts",style: TextStyle(fontWeight: FontWeight.w400),),
              leading: Transform.scale(
                scale: 1.0,
                child: Radio(activeColor: Colors.green,
                    value: 1, groupValue: result, onChanged: (value)=>Changes(value)),
              )),
          ListTile(
              title: Text("My contacts expct...",style: TextStyle(fontWeight: FontWeight.w400),),
              leading: Transform.scale(
                scale: 1.0,
                child: Radio(
                    activeColor: Colors.green,value: 2, groupValue: result, onChanged: (value)=>Changes(value)),
              )),
          ListTile(
              title: Text("Only Share wiht...",style: TextStyle(fontWeight: FontWeight.w400),),
              leading: Transform.scale(
                scale: 1.0,
                child: Radio(activeColor: Colors.green,value: 3, groupValue: result, onChanged: (value)=>Changes(value),
                ),
              )),
          Container(
            padding: EdgeInsets.only(left: 20,),
            width: double.infinity,
            height: 45,
            child: Text("changes to your privacy settings won't affect status updates that you've sent already"),
          ),
        ],
      ),
    );
  }
}
