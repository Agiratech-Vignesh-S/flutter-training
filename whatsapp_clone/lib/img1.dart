import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Status.dart';

class img1 extends StatelessWidget {
  const img1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
          leading: IconButton(
        onPressed: (){
          Navigator.pop(context);

        },
        icon: Icon(Icons.arrow_back),
      )),
      body: Container(
        color: Colors.black,
          height: double.infinity,
          child: Image.asset('assets/images/flower.jpg',))
    );
  }
}
/*Class dialogBox{
required onPressed();
void showDialogBox(){
button:(){
widget.onPressed(){}
}
}
}

Future.delayed(duration:Duration(5),_goback);
*\
 */
