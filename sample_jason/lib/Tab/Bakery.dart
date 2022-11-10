import 'dart:ffi';

import 'package:flutter/material.dart';

import '../provider/Bakery_provider.dart';
import 'package:provider/provider.dart';

class Bakery extends StatefulWidget {
  const Bakery({Key? key}) : super(key: key);

  @override
  State<Bakery> createState() => _BakeryState();
}

class _BakeryState extends State<Bakery> {
  @override
  void initState() {
    super.initState();
    Provider.of<Provider3>(context, listen: false).value1();
  }

  @override
  Widget build(BuildContext context) {
    bool bval = true;
    return Scaffold(
      body: Consumer<Provider3>(
        builder: (context, item, child) => Center(
            child: Column(
          children: [
            ListTile(
              title: Text(item.bakery_list!.name.toString()),
            ),
            ListTile(
                title: Text(item.bakery_list!.type![0].toString()),
                leading: Checkbox(
                  value: bval,
                  onChanged: (val) => setState(() {
                    bval = val!;
                  }),
                )),
            ListTile(
                title: Text(item.bakery_list!.type![1].toString()),
                leading: Checkbox(
                  value: bval,
                  onChanged: (val) => setState(() {
                    bval != val;
                  }),
                )),
            ListTile(
                title: Text(item.bakery_list!.batters!.Batters_type.toString()),
                subtitle: Text(item.bakery_list!.batters!.Batters_id.toString()),
                leading: Checkbox(
                  value: bval,
                  onChanged: (val) => setState(() {
                    bval != val;
                  }),
                )),
          ],
        )),
      ),
    );
  }
}
