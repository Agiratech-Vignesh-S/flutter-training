import 'package:flutter/material.dart';
import 'package:placeholder/Homepage.dart';
import 'package:placeholder/provider/Albumprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AlbumProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  ));
}