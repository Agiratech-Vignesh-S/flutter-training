import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  bool _isInit=true;
  bool _isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration.zero).then((_){
    //   Provider.of<Products>(context).fetchandsetproducts();
    // });
    super.initState();
  }
  @override
  void didChangeDependencies() {

    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchandsetproducts().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text('Show All'),
                    value: FilterOptions.All,
                  ),
                ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                  child:IconButton(
                 icon: Icon(
               Icons.shopping_cart,
                  ),
               onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
                   },
                ),
                  value: cart.itemCount.toString(), color: Colors.cyan,
                ),
    
          ),
        ],
      ),
      drawer: AppDrawer(),
      body:
      // _isLoading?Center(child: CircularProgressIndicator(),) :
      ProductsGrid(_showOnlyFavorites),
    );
  }
}
