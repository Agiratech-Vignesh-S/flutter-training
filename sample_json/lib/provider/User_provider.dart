import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/Student.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
class ProviderExample with ChangeNotifier {
   String? UserId;
   var Users_=[];
  Future<void> factdata() async {
    print("vdf");
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api.json');
    final response = await http.get(url);
    final UserJson = json.decode(response.body);
    print(UserJson);
    UserJson.forEach((key, value) {
      print('values$key');
      Users_.add(Student.fromJson(key, value));
      print(Users_);
    });
    notifyListeners();
    // return Users_;
  }


   Future<void> deleteUser(String id) async {
     final url = Uri.parse(
         'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api/$id.json');
     final del_User = Users_.indexWhere((element) => element.id == id);
     Users_.removeAt(del_User);
     notifyListeners();
     await http.delete(url);
   }

}