
import 'package:flutter/material.dart';

import '../provider/Student_provider.dart';
import 'package:provider/provider.dart';

class Student extends StatefulWidget {
  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderExample>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        // body :  FutureBuilder(
        //   future: ReadJsonData(),
        //   builder: (context, data) {
        //     if (data.hasError) {
        //       return Center(child: Text("${data.error}"));
        //     } else if (data.hasData) {
        //       var items = data.data as List<Student>;
        //       return ListView.builder(
        //           itemCount: items == null ? 0 : items.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               leading: CircleAvatar(backgroundImage:NetworkImage(items[index].imageURL.toString(),),),
        //               title: Text(items[index].name.toString()),
        //               subtitle: Text(items[index].studentScores.toString()),
        //             );
        //           });
        //     } else {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // )
        body:
    Consumer<ProviderExample>(
            builder: (context, itemProvider, child) => (itemProvider
                .sitem.isEmpty)
                ? CircularProgressIndicator()
                : ListView.builder(
                itemCount: itemProvider.sitem == null
                    ? 0
                    : itemProvider.sitem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        itemProvider.sitem[index].imageURL.toString(),
                      ),
                    ),
                    title: Text(itemProvider.sitem[index].name.toString()),
                    subtitle: Text(
                        itemProvider.sitem[index].studentScores.toString()),
                  );
                })
    )
      );
  }
//
// Future<List<Student>> ReadJsonData() async {
//   final jsondata =
//       await rootbundle.rootBundle.loadString('assets/student.json');
//   final list = json.decode(jsondata) as List<dynamic>;
//   return list.map((e) => Student.fromJson(e)).toList();
// }
}
