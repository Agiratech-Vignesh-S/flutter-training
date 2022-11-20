import 'package:flutter/material.dart';
import 'package:httprequest/Edit_screen.dart';
import 'package:httprequest/Home.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:provider/provider.dart';

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
        routes: {Edit_screen.routeName:(context)=>Edit_screen()},
      ),
    );
  }
}
