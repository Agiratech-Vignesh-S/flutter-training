import 'package:flutter/material.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:provider/provider.dart';

import 'Add_prodect.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final val= Provider.of<User_provider>(context);
   print('object${val.Users[0].last_name}');

   return Scaffold(
      appBar: AppBar(
        title: Text("fvdf"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Add_prodect()));
          }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
