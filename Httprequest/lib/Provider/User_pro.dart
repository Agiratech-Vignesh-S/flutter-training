import 'package:flutter/cupertino.dart';
import 'package:httprequest/model/Add_User.dart';

class User_provider with ChangeNotifier {
  final Users = [
  ];

  void add_user(User user) {
    // print('gebve');
    final x=User(id: DateTime.now().toString(),
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        password: user.password);
    Users.add(x);
    print(x);
    notifyListeners();
  }
}