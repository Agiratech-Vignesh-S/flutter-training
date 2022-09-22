import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Transaction> Transactions = [
  ];
var inputtitle;
var inputamount;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(decoration: InputDecoration(label: Text('title'),),
                    onChanged: (val) => inputtitle =val ,
                    ),
                    TextField(decoration: InputDecoration(label: Text('amount'),),
                      onChanged: (val) => inputamount =val ,
                    ),
                    TextButton(onPressed:(){
                      print(inputtitle);
                      print(inputamount);
                    },child: Text('Add Transactions',style: TextStyle(color: Colors.purpleAccent)),),
                  ],
                ),
              ),
            ),
            Column(
              children: Transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        child: Text('\$${tx.amount}',
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.Title,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
