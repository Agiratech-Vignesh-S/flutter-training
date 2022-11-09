import 'package:flutter/services.dart';
import 'package:sample_jason/model/Product_model.dart';
import 'package:sample_jason/model/Student_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;

class ProviderExample with ChangeNotifier {
  List<Student> listItems = [];
  List<Student> Student_list = [];
  Future<List<Student>> studentjson() async {
    final jsondata = await rootbundle.rootBundle.loadString('assets/student.json');
    final list = json.decode(jsondata) as List<dynamic>;
    listItems = list.map((data) => Student.fromJson(data)).toList();
    return listItems;
  }
  Future<void> getvalues() async {
    final response = await studentjson();
    Student_list = response;
    notifyListeners();
  }
  List<Student> get sitem {
    return Student_list;
  }

  Future<String> _loadProductAsset() async {
    return await rootBundle.loadString('assets/Product.json');
  }
   Product? Product_list1;
  Future loadProduct() async {
    String jsonProduct = await _loadProductAsset();
    final jsonResponse = json.decode(jsonProduct);
    Product product =  Product.fromJson(jsonResponse);
    print(product.images[0].imageName);
    return product;
  }

  Future<void> values() async {
    Product_list1 =  await  loadProduct() ;

    print(Product_list1);
    notifyListeners();
  }
  // String get pitem {
  //   return Product_list1;
  // }
}