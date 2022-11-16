import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/Student.dart';
import 'package:http/http.dart'as http;

class ProviderExample with ChangeNotifier {
   String? UserId;
  Student? Users_;
  Future<Student> factdata() async {
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api/-NGoyf-xedxTGuX0db7Y.json');
    final response = await http.get(url);
    final UserJson = json.decode(response.body);
    print(UserJson);
    Student x = Student.fromJson(UserJson);
    Users_ = x;
    notifyListeners();
    return Users_!;
  }
}