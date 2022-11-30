import 'package:flutter/material.dart';
import 'package:httprequest/Screens/Edit_screen.dart';
import 'package:httprequest/Screens/Home.dart';

const editUser = '/edit_screen';
const homePage = '/home-page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    case editUser:
      var data = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (context) {
        return Edit_screen(id: data['id'], add: data['isAdd']);
      });
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text("Check a Route name"),
                ),
              ));
  }
}
