import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:shop_app/Screens/Editproduct_screen.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/User_productItem.dart';
import 'package:shop_app/widgets/app_drawer.dart';

class User_productSreen extends StatelessWidget {
  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
   final productdata= Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User products"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(Edit_Screen.routeName);
          }, icon: Icon(Icons.add),)
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount: productdata.items.length,
            itemBuilder: (_ ,i)=>Column(
              children: [
                UserProduct_item(title: productdata.items[i].title, imagUrl: productdata.items[i].imageUrl),
                Divider(),
              ],
            )),
      ),
    );
  }
}
