import 'package:flutter/material.dart';

import 'package:shop_app/Screen/Cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Screen/Cart_screen.dart';
import '../Widget/Products_grid.dart';
import '../Widget/badge.dart';
import 'package:shop_app/Provider/Cart.dart';

enum Opticons {
  Favorite,
  All,
}

class product_Screen extends StatefulWidget {
  @override
  State<product_Screen> createState() => _product_ScreenState();
}

class _product_ScreenState extends State<product_Screen> {
  var Favoriteonly = false;

  // List<Product>loadedProduct=[
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (Opticons selectvalue) {
                setState(() {
                  if (selectvalue == Opticons.Favorite) {
                    Favoriteonly = true;
                  } else {
                    Favoriteonly = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert_outlined),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        value: Opticons.Favorite, child: Text("favorite")),
                    PopupMenuItem(value: Opticons.All, child: Text("Show all")),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child:ch as Widget,
              value: cart.itemcount.toString(),
            ),child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(Cart_screen.routeName);
            },
          ),
          ),
        ],
      ),
      body: ProductsGrid(Favoriteonly),
    );
  }
}
