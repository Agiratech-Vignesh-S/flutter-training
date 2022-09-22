import 'package:flutter/material.dart';
import '../model/transaction.dart';

class  transactinlist extends StatefulWidget {
  const ({Key? key}) : super(key: key);

  @override
  State<> createState() => _State();
}

class _State extends State<> {
  List<Transaction>userTransaction =[
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
  ]
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
