import 'package:callbackfunction/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final val=Provider.of<provider>(context);
    return WillPopScope(
      onWillPop: ()async{
        print("Back button press");
        return await showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text("Do you exit the app..."),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context,false);
            }, child: Text("No")),
            ElevatedButton(onPressed: () {
              Navigator.pop(context,true);
            }, child: Text("Yes"))
          ],
        )
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("First Screen"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed('/second_screen');
            }, icon: const Icon(Icons.arrow_forward_rounded))
          ],
        ),
        body: PageView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Click Button",style: TextStyle(fontSize: 20),),
                Center(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){
                        val.decrement();
                      }, child: const Text("-",style: TextStyle(fontSize: 45),)),
                      TextButton(onPressed: (){
                        val.increment();
                      }, child: const Text("+",style: TextStyle(fontSize: 45),)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}
