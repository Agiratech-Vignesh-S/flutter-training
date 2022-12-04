import 'package:flutter/material.dart';
import 'package:watherapp/Screen/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:watherapp/Provider/Service.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
