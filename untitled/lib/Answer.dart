import 'package:flutter/material.dart';
import 'main.dart';
class Answer extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
   VoidCallback selectHandler;
   dynamic  Answertext;

  Answer(this.Answertext,this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(28),
      width: double.infinity,
      child: ElevatedButton(onPressed:selectHandler,
        style: ElevatedButton.styleFrom(
            primary: Colors.blue),
        child: Text(Answertext),),
    );
  }
}
