import 'package:demoapp/Quiz.dart';
import 'package:flutter/material.dart';
// import 'Answer.dart';
import 'result.dart';
// import 'question.dart';
void main() =>runApp(MyApp());

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return _MyAppState();
}
}

class _MyAppState extends State<MyApp> {
  var _questionindex = 0;
  var  score=0;
  int _answerQuestion(int  score){
    totalScore += score;
    setState((){
      _questionindex += 1;

    });

    print(_questionindex);
  if(_questionindex<question.length){
    print('We have more question');
  }else{
    print('no more question');
  }
  return 0;
  }
  static var question= [
    {
      'questionText': 'What\'s your favorite car?',
      'answers': [
        {'text': 'BMW', 'score': 10},
        {'text': 'RR', 'score': 5},
        {'text': 'Royal', 'score': 3},
        {'text': 'HOND', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Food?',
      'answers': [
        {'text': 'veg', 'score': 10},
        {'text': 'Non-veg', 'score': 5},
        {'text': 'fast food', 'score': 3},
        {'text': 'All', 'score': 1},
      ],
    },
  ];

  // print(question.length-1);
  var totalScore=0;
//void _answertext(int score){

//}
  void  result(){
    setState(() {
    _questionindex=0;
    score=0;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar:
        AppBar(title: Text('First App')),
        body: (_questionindex < question.length)
          ?
          Quiz(questions: question,
              answerQuestion: _answerQuestion,
              questionIndex: _questionindex)
            :
          Result(totalScore,result),
    ),
    );
  }
}

