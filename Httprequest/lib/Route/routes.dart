import 'package:flutter/material.dart';
import 'package:httprequest/Edit_screen.dart';
import 'package:httprequest/Home.dart';

const editUser = '/edit_screen';
const homePage = '/home-page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) =>  Home(),
      );
    case editUser:
      var data = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (context) {
        return Edit_screen(id: data['id'], add: data['add']);
      });
    default:
      return MaterialPageRoute(builder: (context)=>Scaffold(body: Text("no route defind"),));
  }
}