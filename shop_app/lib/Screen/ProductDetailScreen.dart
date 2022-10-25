import 'package:flutter/material.dart';


import 'package:shop_app/Widget/Product_item.dart';
class ProductDetailscreen extends StatelessWidget {
  // final String title;
  // final double price;
  //
  // const ProductDetailscreen({super.key, required this.title, required this.price});

  static const routeName='/product-details';

  @override
  Widget build(BuildContext context) {
   final productID= ModalRoute.of(context)!.settings.arguments as String;
 //  Provider.of<products>(context);

    return Scaffold(
       appBar: AppBar(
       title: Text("fjbvk"),
),
    );
  }
}
