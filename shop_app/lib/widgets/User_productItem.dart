import 'package:flutter/material.dart';
import 'package:shop_app/Screens/Editproduct_screen.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
class UserProduct_item extends StatelessWidget {
  final String id;
 final String title;
 final String imagUrl;

  const UserProduct_item({super.key, required this.title, required this.imagUrl, required this.id});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading:
      CircleAvatar
        (backgroundImage:
      NetworkImage(imagUrl)
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(Edit_Screen.routeName,arguments: {'id':id,'isAdd':false});
            }, icon: Icon(Icons.edit)),
            IconButton(onPressed: (){
              Provider.of<Products>(context,listen: false).deletproduct(id);
            }, icon: Icon(Icons.delete,color: Theme.of(context).errorColor,)),
          ],
        ),
      ),
    );
  }
}
