import 'package:flutter/material.dart';
import 'package:sample_jason/provider/address_provider.dart';
import 'package:provider/provider.dart';
class Address_tab extends StatefulWidget {
  const Address_tab({Key? key}) : super(key: key);

  @override
  State<Address_tab> createState() => _Address_tabState();
}

class _Address_tabState extends State<Address_tab> {
  @override
  void initState() {
    super.initState();
    Provider.of<Address_provider>(context, listen: false).addressval();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Address_provider>(
        builder: (context, item, child) =>Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("city : ${item.address_list!.city}"),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Street : ${item.address_list!.streets[0]}"),
            Text("Street : ${item.address_list!.streets[1]}"),
          ],
        )
      ],
    ),
      )
    );
  }
}
