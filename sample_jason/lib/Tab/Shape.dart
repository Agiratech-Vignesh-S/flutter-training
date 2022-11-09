import 'package:flutter/material.dart';
import 'package:sample_jason/provider/Shape_provider.dart';
import 'package:provider/provider.dart';
class Shape extends StatefulWidget {
   Shape({Key? key}) : super(key: key);

  @override
  State<Shape> createState() => _ShapeState();
}

class _ShapeState extends State<Shape> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Provider2>(context, listen: false).value();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Provider2>(
        builder: (context,item,child)=>Center(
          child: Container(
            color: Colors.orange,
            width: item.Shape_list?.property.width,
            height: item.Shape_list?.property.hight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.Shape_list!.shapeName),
              Text("width:${item.Shape_list?.property.width}"),
              Text("width:${item.Shape_list?.property.hight}")
            ],
          ),
      ),
        ),
      )
    );
  }
}
