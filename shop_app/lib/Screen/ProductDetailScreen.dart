import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../Provider/produts.dart';
class ProductDetailscreen extends StatelessWidget {
  // final String title;
  // final double price;
  //
  // const ProductDetailscreen({super.key, required this.title, required this.price});

  static const routeName='/product-details';

  @override
  Widget build(BuildContext context) {
    final productID= ModalRoute.of(context)!.settings.arguments as String ;
  final loaded= Provider.of<Products>(context,listen: false).findById(productID);

    return Scaffold(
       appBar: AppBar(
       title: Text(loaded.title),
),
    );
  }
}
