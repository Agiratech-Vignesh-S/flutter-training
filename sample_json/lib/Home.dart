import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_json/provider/User_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderExample>(context, listen: false).factdata();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProviderExample>(context);
    return Scaffold(
        appBar: AppBar(
        title: Text('http request'),
    ),
    body:ListView.builder(
    itemCount: user.Users_.length,
    itemBuilder: ((context, index) =>
        ListTile(
                    title: Text("name : ${user.Users_[index].first_name} ""${user.Users_[index].last_name}",),
           subtitle: Text("email : ${user.Users_[index].email}"),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  // print('id of edited product${user.Users_[index].id}');
                  // final id = user.Users_[index].id.toString();
                  // Navigator.of(context).pushNamed(
                  //     Edit_screen.routeName,
                  //     arguments: {'id': id, 'isAdd': false});
                }, icon: Icon(Icons.edit,color: Colors.green,)),
                IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){
                  Provider.of<ProviderExample>(context,
                      listen: false)
                      .deleteUser(
                      user.Users_[index].id.toString());
                },),
              ],
            ),
          ),
    )),
    )

    );
  }
}
