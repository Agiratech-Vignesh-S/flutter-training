import 'package:flutter/material.dart';
import 'package:httprequest/Edit_screen.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    var isLoading = true;
    Provider.of<User_provider>(context, listen: false).fetchusers();
    isLoading = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final val= Provider.of<User_provider>(context);
   // print('object${val.Users_[0].last_name}');

   return Scaffold(
      appBar: AppBar(
        title: Text("http request"),
        actions: [
          IconButton(onPressed: (){
            // final id = val.Users_[index].id.toString();
            Navigator.of(context).pushNamed(
                Edit_screen.routeName,
                arguments: {'id': '', 'isAdd': true});
          }, icon: Icon(Icons.add))
        ],
      ),
     body: ListView.builder(
       itemCount: val.Users_.length,
       itemBuilder: ((context, index) =>
           ListTile(
             title: Text(
                  "name : ${val.Users_[index].first_name} "
                      "${val.Users_[index].last_name}"
                      ,
           ),
             subtitle: Text("email : ${val.Users_[index].email}"),
             trailing: SizedBox(
               width: 100,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   IconButton(onPressed: (){
                     print('id of edited product${val.Users_[index].id}');
                     final id = val.Users_[index].id.toString();
                     Navigator.of(context).pushNamed(
                         Edit_screen.routeName,
                         arguments: {'id': id, 'isAdd': false});
                   }, icon: Icon(Icons.edit,color: Colors.green,)),
                   IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){
                     Provider.of<User_provider>(context,
                         listen: false)
                         .deleteUser(
                         val.Users_[index].id.toString());
                   },),
                 ],
               ),
             ),
     )
       ),
    ));
  }
}
