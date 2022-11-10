import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/address_model.dart';
import 'package:provider/provider.dart';

class Address_provider with ChangeNotifier{

  Future<String>loadasset()async{
    return await rootBundle.loadString('assets/address.json');
  }

  Address? address_list;
  Future Loadaddress()async{
    String jsonString=await loadasset();
    final jsonResponse=json.decode(jsonString);
    Address address = Address.fromJson(jsonResponse);
    return address;
  }
  Future<void>addressval()async{
    address_list=await Loadaddress();
    notifyListeners();
  }
}