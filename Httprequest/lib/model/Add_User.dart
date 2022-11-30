import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? id;
  String? uuid;
  String? first_name;
  String? last_name;
  String? email;
  String? password;

  User(
      {required this.id,
      required this.uuid,
      required this.first_name,
      required this.last_name,
      required this.email,
      required this.password});
}
