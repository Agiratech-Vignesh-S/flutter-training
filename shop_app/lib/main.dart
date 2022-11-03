import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';

import 'package:shop_app/screens/User_product_Screen.dart';
import 'package:shop_app/screens/auth_screen.dart';

import 'package:shop_app/screens/splashScreen.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './Screens/Editproduct_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products('','',[]),
            update: (ctx, auth, PreviousProduct) =>
                Products(auth.token,
                    auth.UserId,
                    (PreviousProduct == null ? [] :
                PreviousProduct.items
                )
                )
        ),

        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
            create: (_) => Orders('','', []),
            update: (ctx, auth, PreviousProduct) =>
                Orders(auth.token,
                    auth.UserId,
                    (PreviousProduct == null ? [] :
                PreviousProduct.orders
                )
                )
        ),
      ],
      child: Consumer<Auth>(builder: (context, Auth, _) =>
          MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MyShop',
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato',
              ),
              home: Auth.isAuth
                  ? ProductsOverviewScreen()
                  : FutureBuilder(
                  future: Auth.TryAutoLogin(),
                  builder: (ctx, authsnapshot) =>
                  authsnapshot.connectionState ==
                      ConnectionState.waiting
                      ? SplashScreen()
                      : AuthScreen()),
              routes: {
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                CartScreen.routeName: (ctx) => CartScreen(),
                OrdersScreen.routeName: (ctx) => OrdersScreen(),
                User_productSreen.routeName: (ctx) => User_productSreen(),
                Edit_Screen.routeName: (cxt) => Edit_Screen(),
              }),
      ),
    );
  }
}
