import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathermodel/Autocompleted.dart';
import 'package:weathermodel/provider/Provider.dart';

@override
Widget SliverAppBarWidget(BuildContext context) {
  final val1 = Provider.of<WeatherProvider>(context);
  return SliverAppBar(
    title:val1.changes?Autocompleted(context):
    TextButton(onPressed: (){
      val1.changes?
      val1.changeval(false):
      val1.changeval(true);
    }, child:Text("${val1.query}",style: TextStyle(fontSize: 30,color: Colors.white))),
    centerTitle: true,
    expandedHeight: 200.0,
    floating: true,
    pinned: true,
    flexibleSpace: LayoutBuilder(builder: (p0, p1) {
       val1.top=p1.biggest.height;
      return FlexibleSpaceBar(
          centerTitle: true,
          background: Image.network("${val1.image()}",
            fit: BoxFit.cover,
          ));
    },
    ),
    actions: [
      IconButton(onPressed: (){
        val1.changeval(false);
      }, icon: val1.changes?Icon(Icons.close):Icon(Icons.filter_list_outlined))
    ],
    backgroundColor: Colors.transparent,
elevation: 0,
automaticallyImplyLeading: true,
  );
}