import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:httprequest/Url.dart';
import 'package:httprequest/model/Add_User.dart';
import 'package:http/http.dart' as http;
import 'package:httprequest/model/CoustomException.dart';
import 'package:uuid/uuid.dart';

class User_provider with ChangeNotifier {
  var Users_ = [];
  var uuid = Uuid();


  Future<void> fetchusers() async {
    final url = Uri.parse(urLfet);
    try {
      final response = await http.get(url);
      final extractedUserData =
          json.decode(response.body) as Map<String, dynamic>;
      extractedUserData.forEach((key, value) {
        Users_.add(User(
          id: key,
          uuid: value['uuid'],
          first_name: value['first_name'],
          last_name: value['last_name'],
          email: value['email'],
          password: value['password'],
        ));
      });
      notifyListeners();
    } catch (e) {
      throw OwnHttpException(message: "Filed to fetch user");
    }
  }

  Future<void> deleteUser(String id) async {
    final url = Uri.parse(Url1(id));
    print(url);
    try {
      final del_User = Users_.indexWhere((element) => element.id == id);
      Users_.removeAt(del_User);
      print(url);
      await http.delete(url);
      notifyListeners();
    } catch (error) {
      throw OwnHttpException(message: "filed to delete user");
    }
  }

  User findById(String id) {
    return Users_.firstWhere((element) => element.id == id);
  }

  Future<void> add_and_edit(String id, User user) async {
    if (id == '0') {
      final url = Uri.parse(urLfet);
      final value = http
          .post(url,
              body: json.encode({
                'first_name': user.first_name,
                'uuid': uuid.v1(),
                'last_name': user.last_name,
                'email': user.email,
                'password': user.password,
              }))
          .then((value) {
        User(
          id: json.decode(value.body)['name'],
          uuid: user.uuid,
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          password: user.password,
        );
        Users_.add(User);
        notifyListeners();
      });
    } else {
      User newUser = user;
      final userIndex = Users_.indexWhere((element) => element.id == id);
      if (userIndex >= 0) {
        final url = Uri.parse(Url1(id));
        await http
            .patch(url,
                body: json.encode({
                  'first_name': newUser.first_name,
                  'last_name': newUser.last_name,
                  'email': newUser.email,
                  'password': newUser.password,
                }))
            .then((value) {});

        Users_[userIndex] = newUser;

        notifyListeners();
      }
    }
  }
}
