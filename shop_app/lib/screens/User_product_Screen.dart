import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:shop_app/Screens/Editproduct_screen.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/User_productItem.dart';
import 'package:shop_app/widgets/app_drawer.dart';

class User_productSreen extends StatelessWidget {
  static const routeName = '/user-product';

  Future<void>_refreshProduct(BuildContext context)async{
    Provider.of<Products>(context,listen: false).fetchandsetproducts(true);
  }
  @override
  Widget build(BuildContext context) {
   // final productdata= Provider.of<Products>(context);
    print("rebuild...");
   bool isAdd=true;
   String id='c1';
    return Scaffold(
      appBar: AppBar(
        title: Text("User products"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(Edit_Screen.routeName,
                arguments: {'id': id, 'isAdd': isAdd}
            );
          }, icon: Icon(Icons.add),)
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProduct(context),
        builder:(ctx,snapshot)=>snapshot.connectionState==ConnectionState.waiting? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
          onRefresh: ()=>_refreshProduct(context),
          child: Consumer<Products>(
            builder:(cxt,productdata,_)=> Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(itemCount: productdata.items.length,
                  itemBuilder: (_ ,i)=>Column(
                    children: [
                      UserProduct_item(
                          id:productdata.items[i].id,
                          title: productdata.items[i].title, imagUrl: productdata.items[i].imageUrl),
                      Divider(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
