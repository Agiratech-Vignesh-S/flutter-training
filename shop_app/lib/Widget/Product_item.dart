import 'package:flutter/material.dart';
import 'package:shop_app/Screen/ProductDetailScreen.dart';

class Product_item extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const Product_item({super.key, required this.id, required this.title, required this.imageUrl});



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(child: GestureDetector(
        onTap: (){
         Navigator.of(context).pushNamed(ProductDetailscreen.routeName,
         arguments: id
         );
        },
        child: Image.network(imageUrl,
        fit: BoxFit.cover,
        ),
      ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.favorite,
            color: Theme.of(context).accentColor,
            ),
            onPressed: (){},
          ),
          trailing: IconButton(onPressed: (){},
          icon: Icon(Icons.shopping_cart,
            color: Theme.of(context).accentColor,
          ),),
          backgroundColor:Colors.black87 ,
          title: Text(title,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
