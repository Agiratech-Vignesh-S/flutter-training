import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Transaction> Transactions = [
    Transaction(
      id: 'T1',
      Title: 'new phone',
      amount: 2000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      Title: 'new charger',
      amount: 100,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.orange,
                child: Text('CHART'),
                elevation: 6,
              ),
            ),
            Column(
              children: Transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),),

                        child: Text(tx.amount.toString()),

                      ),
                      Column(
                        children: <Widget>[
                          Text(tx.Title),
                          Text(tx.date.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
