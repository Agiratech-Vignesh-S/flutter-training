import 'package:flutter/material.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:provider/provider.dart';
import 'package:httprequest/Route/routes.dart'as route;
import 'package:httprequest/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => User_provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
          onGenerateRoute: route.controller,
      ),
    );
  }
}
