import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sample_jason/model/Shape_model.dart';

class Provider2 with ChangeNotifier{

  Future<String>loadasset()async{
    return await rootBundle.loadString('assets/Shape.json');
  }

  Shape? Shape_list;
  Future LoadShape()async{
    String jsonShape=await loadasset();
    final jsonResponse=json.decode(jsonShape);
    Shape shape = Shape.fromJson(jsonResponse);
    print(shape.property.hight);
    return shape;
  }
  Future<void>value()async{
    Shape_list=await LoadShape();
    notifyListeners();
  }
}