



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/page_model.dart';

class Provider5 with ChangeNotifier {
  // List<PageModel> items = [];
  PageModel? pageItems;

  Future<PageModel> pagejson() async {
    String jsondata = await rootBundle.loadString('assets/page.json');
    final list = json.decode(jsondata);
    PageModel items =  PageModel.fromJson(list);
    print('load${items}');
    return items;
  }

  Future<void> pagevalue() async {
    final response = await pagejson();
    pageItems = response;
    // print(response.data![0].id);
    notifyListeners();
  }
  // List<PageModel> get pageItem {
  //   return pageItems;
  // }
}