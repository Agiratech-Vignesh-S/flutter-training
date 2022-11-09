
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart'as rootbundle;
import 'package:provider/provider.dart';

import '../model/Photos_model.dart';

class Provider1 with ChangeNotifier{
  List<Photo> list1=[];
  List<Photo> product_list=[];

  Future<List<Photo>>photojson()async{
    final jsondata = await rootbundle.rootBundle.loadString('assets/Photos.json');
    final list =await json.decode(jsondata) as List<dynamic>;
    list1 = list.map((data) => Photo.fromJson(data)).toList();
    return list1;
  }
  Future<void> getvalues() async {
    final response = await photojson();
    product_list = response;
    notifyListeners();
  }
}