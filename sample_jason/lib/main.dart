import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:provider/provider.dart';
import 'package:sample_jason/Tab/Shape.dart';
import 'package:sample_jason/provider/Bakery_provider.dart';
import 'package:sample_jason/provider/College_provider.dart';
import 'package:sample_jason/provider/Photo_provider.dart';
import 'package:sample_jason/provider/Shape_provider.dart';
import 'package:sample_jason/provider/Student_provider.dart';
import 'package:sample_jason/provider/address_provider.dart';
import 'package:sample_jason/provider/page_provider.dart';

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
        ChangeNotifierProvider(create: (context)=>Provider3()),
        ChangeNotifierProvider(create: (context)=>Provider4()),
        ChangeNotifierProvider(create: (context)=>Provider5()),
        ChangeNotifierProvider(create: (context)=>Address_provider())
      ],
        
        child: MaterialApp(debugShowCheckedModeBanner: false,
            home: Home()));
  }
}
