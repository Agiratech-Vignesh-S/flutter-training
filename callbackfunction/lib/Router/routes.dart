




import 'package:callbackfunction/Screen/Thirdpage.dart';
import 'package:callbackfunction/Screen/SecondPage.dart';
import 'package:callbackfunction/Screen/Homepage.dart';
import 'package:flutter/material.dart';

import '../Screen/Four.dart';

const homePage = '/home-page';
const second_page = '/second_screen';
const third_page = '/third_screen';
const Four_page = '/Four_screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) => const Homepage(),
      );
    case second_page:
      return MaterialPageRoute(
        builder: (context) =>  SecondPage(),
      );
    case third_page:
      return MaterialPageRoute(
        builder: (context) =>  ThirdScreen(),
      );
    case Four_page:
      return MaterialPageRoute(
        builder: (context) =>  Four(),
      );
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