import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:provider/provider.dart';
import 'package:sample_jason/Tab/Shape.dart';
import 'package:sample_jason/provider/Photo_model.dart';
import 'package:sample_jason/provider/Shape_provider.dart';
import 'package:sample_jason/provider/Student_provider.dart';

import 'Home.dart';
import 'Tab/Student.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context)=> ProviderExample(),),
        ChangeNotifierProvider(create: (context)=>Provider1()),
        ChangeNotifierProvider(create: (context)=>Provider2()),
      ],
        
        child: MaterialApp(debugShowCheckedModeBanner: false,
            home: Home()));
  }
}
