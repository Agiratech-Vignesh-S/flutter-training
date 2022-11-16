import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_json/provider/User_provider.dart';

import 'Home.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderExample(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Home(),
      ),
    );
}
}
