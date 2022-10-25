import 'package:flutter/material.dart';

import 'package:shop_app/model/product.dart';

class Products with ChangeNotifier{
  List<Product>_item=[
  ];

  List<Product> get item {
    return [..._item];
  }
    void addproduct(){
   notifyListeners();
  }
}