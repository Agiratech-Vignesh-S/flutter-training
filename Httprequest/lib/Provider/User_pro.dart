import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:httprequest/model/Add_User.dart';
import 'package:http/http.dart'as http;
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
        print('${json.decode(value.body)['name']}');
        User(
            id: json.decode(value.body)['name'],
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email,
            password: user.password,);
        Users_.add(User);
        print('users${Users_[0].id}');
        notifyListeners();
      });
    } catch (e) {
      rethrow;
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
      // final List<User> usersList = [];
      extractedUserData.forEach((key, value) {
        // print('values$value');
        Users_.add(User(
            id: key,
            first_name: value['first_name'],
          last_name: value['last_name'],
          email: value['email'],
            password: value['password'],
        )
        );
      });
      print('object');
      // Users_ = usersList;
      notifyListeners();
      // print(Users_[0].id);
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
    print(id);
    print('update index$userIndex');
    print('userIndex\$${newUser.first_name}');
    if (userIndex >= 0) {
      print('data matched');
      final url = Uri.parse(
          'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/api/$id.json');
      await http.patch(url,
          body: json.encode({
            'name': newUser.first_name,
            'last_name':newUser.last_name,
            'email': newUser.email,
            'password': newUser.password,
          }))
          .then((value) {
        print(value);
      });
      print('old data email${Users_[userIndex].email}');
      print(' new mail data${newUser.email}');

      Users_[userIndex] = newUser;

      notifyListeners();
    }
  }
}