import 'package:demoapp2/Widget/chart_bar.dart';
import 'package:demoapp2/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //const Chart({super.key});
  final List<Transaction> Recenttransacion;
  Chart(this.Recenttransacion);
  List<Map<String, Object>> get GroupedTransactionvalues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalsum;

      for (var i = 0; i < Recenttransacion.length; i++) {
        if (Recenttransacion[i].date.day == weekDay.day &&
            Recenttransacion[i].date.month == weekDay.month &&
            Recenttransacion[i].date.year == weekDay.year) {
          totalsum = Recenttransacion[i].amount;
        }
      }

      // print(DateFormat.E().format(weekDay));
      // print(totalsum);

      return {'day': DateFormat.E().format(weekDay), 'amount': '92.4'};
    });
  }

  double get totalSpending {
    return GroupedTransactionvalues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: GroupedTransactionvalues.map((e) {
          // return Text('${e['day']}:${e['amount']}');
          return Chartbar(e['day'] as String, e['amount'] as double,
              (e['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
