import 'package:flutter/material.dart';
import 'package:sample_jason/provider/College_provider.dart';

import '../provider/page_provider.dart';
import 'package:provider/provider.dart';
class Page_tab extends StatefulWidget {
  const Page_tab({Key? key}) : super(key: key);

  @override
  State<Page_tab> createState() => _Page_tabState();
}

class _Page_tabState extends State<Page_tab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Provider5>(context, listen: false).pagevalue();

  }
  @override
  Widget build(BuildContext context) {
    final values=Provider.of<Provider5>(context);
    print('Object${values}');
    print('Object${values.pageItems}');
    print('Object${values}');
    return Scaffold(
      body: Consumer<Provider5>(
        builder: (context, item, child) =>Column(
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Card(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("page : ${values.pageItems!.page.toString()}"),
                  Text("perpage : ${values.pageItems!.perPage.toString()}"),
                  Text("firstName : ${values.pageItems!.author!.firstName.toString()}"),
                  Text("lastName : ${values.pageItems!.author!.lastName.toString()}"),
                  Text("data_id : ${values.pageItems!.data![0].id.toString()}"),
                ],
              ),
            ),
          ),
          ListTile(leading:
          Image.network(values.pageItems!.data![0].avatar.toString()),
              title: Text("firstName : ${values.pageItems!.data![0].first_name.toString()}"),
              subtitle: Text("lastName : ${values.pageItems!.data![0].last_name.toString()}"),
            ),
        ListTile(leading:
        Image.network(values.pageItems!.data![1].avatar.toString()),
            title: Text("firstName : ${values.pageItems!.data![1].first_name.toString()}"),
            subtitle: Text("lastName : ${values.pageItems!.data![1].last_name.toString()}"),
          ),
        ListTile(leading:
        Image.network(values.pageItems!.data![2].avatar.toString()),
            title: Text("firstName : ${values.pageItems!.data![2].first_name.toString()}"),
            subtitle: Text("lastName : ${values.pageItems!.data![2].last_name.toString()}"),
          ),
      ],
    ),
      )
    );
  }
}
