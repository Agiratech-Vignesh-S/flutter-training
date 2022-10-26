import 'package:flutter/material.dart';
import 'package:shop_app/Screen/ProductDetailScreen.dart';
import 'package:shop_app/Screen/product_Screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Screen/Cart_screen.dart';
import 'Provider/Cart.dart';
import 'Provider/produts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
        value:Products(),
        ),
        ChangeNotifierProvider.value(
        value:Cart(),
        ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "My Shop",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Lato',
            accentColor: Colors.orange
          ),
          home: product_Screen(),
          routes:
          {
            ProductDetailscreen.routeName: (ctx) => ProductDetailscreen(),
            Cart_screen.routeName: (ctx) => Cart_screen()
          }
        ),
    );
  }
}



