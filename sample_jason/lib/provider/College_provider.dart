import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_jason/model/Collage_model.dart';

class Provider4 with ChangeNotifier{

  Future<String>loadasset()async{
    return await rootBundle.loadString('assets/collage.json');
  }

  College? college_list;
  Future Loadcollege()async{
    String jsonString=await loadasset();
    final jsonResponse=json.decode(jsonString);
    College college = College.fomJson(jsonResponse);

    return college;
  }
  Future<void>value2()async{
    final values=await Loadcollege();
    college_list=values;
    notifyListeners();
  }
}