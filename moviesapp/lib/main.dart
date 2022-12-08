import 'package:flutter/material.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';
import 'package:moviesapp/Router/route.dart' as route;
import 'Screen/Myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Moviesprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: route.controller,
        home: MyHomePage(),
      ),
    );
  }
}

