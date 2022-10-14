import 'package:flutter/material.dart';

class Linked_devices extends StatelessWidget {
  const Linked_devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back),),
        title: const Text("Linked devices",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: 200,
                  width: double.infinity,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/laptop1.png')),
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  child: const Center(child: Text("Use WhatsApp on other devices",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white10),)),
                ),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: (){}, child: const Text("LINK A DEVICE"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.lock,size: 15,),
                      SizedBox(width: 2,),
                      Text("Your personal messages are end-to-end encrypted on all your devies.",style: TextStyle(fontSize: 11),)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(

            height: 300,
            padding: const EdgeInsets.all(50),
            child: const Center(
              child: Text("Use WhatsApp on web, desktop or other devies without keeping your phone online."),
            ),
          )
        ],
      ),
    );
  }
}
