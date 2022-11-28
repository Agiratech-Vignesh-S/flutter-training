import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:httprequest/model/Add_User.dart';
import 'package:http/http.dart'as http;
import 'package:httprequest/model/CoustomException.dart';
class User_provider with ChangeNotifier {

  var Users_ = [
  ];
   add_user(User user) {
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api.json');
    try {
      final value = http.post(url,
          body: json.encode({
            'first_name':user.first_name,
            'last_name':user.last_name,
            'email': user.email,
            'password': user.password,
          }))
          .then((value) {
        User(
            id: json.decode(value.body)['name'],
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email,
            password: user.password,);
        Users_.add(User);
        notifyListeners();
      });
    } catch (e) {
      throw CustomException(message: "Faild to load photo");
    }
    // print(user);
  }
  Future<void> fetchusers() async {
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api.json');
    try {
      final response = await http.get(url);
      final extractedUserData =
      json.decode(response.body) as Map<String, dynamic>;
      extractedUserData.forEach((key, value) {
        Users_.add(User(
            id: key,
            first_name: value['first_name'],
            last_name: value['last_name'],
            email: value['email'],
            password: value['password'],
        )
        );
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String id) async {
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api/$id.json');
    final del_User = Users_.indexWhere((element) => element.id == id);
    Users_.removeAt(del_User);
    notifyListeners();
    await http.delete(url);
  }


  User findById(String id) {
    return Users_.firstWhere((element) => element.id == id);
  }


  Future<void> updateUser(String id, User newUser) async {
    final userIndex = Users_.indexWhere((element) => element.id == id);
    if (userIndex >= 0) {
      final url = Uri.parse(
          'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api/$id.json');
      await http.patch(url,
          body: json.encode({
            'first_name': newUser.first_name,
            'last_name':newUser.last_name,
            'email': newUser.email,
            'password': newUser.password,
          }))
          .then((value) {
      });

      Users_[userIndex] = newUser;

      notifyListeners();
    }
  }
}