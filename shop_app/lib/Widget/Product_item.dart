import 'package:flutter/material.dart';
import 'package:shop_app/Provider/Cart.dart';
import 'package:shop_app/Provider/product.dart';
import 'package:shop_app/Screen/ProductDetailScreen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/Cart.dart';

class Product_item extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  //  Product_item(  this.id,  this.title,  this.imageUrl);



  @override
  Widget build(BuildContext context) {
   final products= Provider.of<Product>(context);
   final cart=Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(child: GestureDetector(
        onTap: (){
         Navigator.of(context).pushNamed(ProductDetailscreen.routeName,
         arguments: products.id
         );
         // print(id);
        },
        child: Image.network(products.imageUrl,
        fit: BoxFit.cover,
        ),
      ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder:(cxt,Product,_)=> IconButton(
              icon: Icon(products.isFavorite ?Icons.favorite :Icons.favorite_border_outlined,
              color: Theme.of(context).accentColor,
              ),
              onPressed: (){
                products.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(onPressed: (){
            cart.addItem( products.id, products.price,products.title);
          },
          icon: Icon(Icons.shopping_cart,
            color: Theme.of(context).accentColor,
          ),),
          backgroundColor:Colors.black87 ,
          title: Text(products.title,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
