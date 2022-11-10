import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sample_jason/model/Bakery_model.dart';

class Provider3 with ChangeNotifier{

  Future<String>loadasset()async{
    return await rootBundle.loadString('assets/bakery.json');
  }

  Bakery? bakery_list;
  Future Loadbakery()async{
    String jsonString=await loadasset();
    final jsonResponse=json.decode(jsonString);
    Bakery bakery = Bakery.fromJson(jsonResponse);
    print(bakery.batters?.Batters_type);
    return bakery;
  }
  Future<void>value1()async{
    bakery_list=await Loadbakery();
    notifyListeners();
  }
}