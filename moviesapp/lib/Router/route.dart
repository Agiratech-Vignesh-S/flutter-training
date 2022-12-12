import 'package:flutter/material.dart';

import '../Screen/Detialpage/DetilePage.dart';
import '../Screen/Myhomepage.dart';

Route<dynamic> controller(RouteSettings settings) {
  const Detailscreen='/Detial_screen';
  const homepage='/home_page';
  switch (settings.name) {

    case Detailscreen:
      var data = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) {
          return DetilPage(index: data['index'],id: data['id'],);},
      );
    case homepage:
      return MaterialPageRoute(builder: (context) => MyHomePage(),);
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