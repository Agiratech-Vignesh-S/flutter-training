import 'package:flutter/material.dart';

class User with ChangeNotifier{
  final String? id;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? password;

  User({required this.id,required this.first_name,required this.last_name,required this.email,required this.password});

}
