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
    final user= Provider.of<ProviderExample>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('http request'),
      ),
      body: ListTile(
        title: Text("name : ${user.Users_?.first_name!}  ${user.Users_?.last_name!}"),
        subtitle: Text("email :  ${user.Users_?.email!}"),
      )

    );
  }
}
