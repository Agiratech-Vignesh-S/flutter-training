import 'package:callbackfunction/Screen/SecondPage.dart';
import 'package:callbackfunction/Screen/Homepage.dart';
import 'package:callbackfunction/provider.dart';
import 'package:flutter/material.dart';
import 'package:callbackfunction/Router/routes.dart'as route;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widget Communication',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: route.controller,
        home: Homepage(),
      ),
    );
  }
}