import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  //const Chartbar({super.key});
  String label;
  double spendingamount;
  double spendingpicoftotal;

  Chartbar(this.label, this.spendingamount, this.spendingpicoftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${spendingamount.toStringAsFixed(3)}'),
        SizedBox(
          height: 60,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: spendingpicoftotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
