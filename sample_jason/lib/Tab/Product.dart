import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Student_provider.dart';
class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderExample>(context, listen: false).values();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderExample>(
        builder: (context,item,child)=>
        // (item.isEmpty)
        //     ? CircularProgressIndicator()
        //     :
        Column(
          children: [
            ListTile(
              title: Text(item.Product_list1!.name),
              trailing: Text(item.Product_list1!.images[0].imageId.toString()),
              subtitle: Text(item.Product_list1!.images[0].imageName.toString()),
              // subtitle: Text(item.pitem[1].id.toString()),
            ),
            ListTile(
              title: Text(item.Product_list1!.name),
              trailing: Text(item.Product_list1!.images[1].imageId.toString()),
              subtitle: Text(item.Product_list1!.images[1].imageName.toString()),
              // subtitle: Text(item.pitem[1].id.toString()),
            )
          ],
        )),
    );
  }
}
