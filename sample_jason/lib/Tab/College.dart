import 'package:flutter/material.dart';

import '../provider/College_provider.dart';
import 'package:provider/provider.dart';
class College_Tab extends StatefulWidget {
  const College_Tab({Key? key}) : super(key: key);

  @override
  State<College_Tab> createState() => _College_TabState();
}

class _College_TabState extends State<College_Tab> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Provider4>(context, listen: false).value2();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Provider4>(
        builder: (context, item, child) => Column(
      children: [
          ListTile(
            title: Text(item.college_list!.name!),
            subtitle: Text("major:${item.college_list!.majors![0]}"),
          ),
         ListTile(
            title: Text("subjectName : ${item.college_list!.subjects![0].subjectName}"),
            subtitle: Text("teacher  : ${item.college_list!.subjects![0].teacher}"),
      )
      ],
    ),
    )
    );
  }
}
