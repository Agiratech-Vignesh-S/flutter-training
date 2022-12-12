import 'package:flutter/material.dart';
import 'package:moviesapp/Screen/Detialpage/bodyWidget.dart';
import 'package:provider/provider.dart';

import '../../model/movievideomodel.dart';
import 'SliverAppbar.dart';
import '../../provider/moviesprovider.dart';

class DetilPage extends StatefulWidget {
  static const routeName = '/Detial_screen';
  static const routName='/home_page';
  int index;
  int id;
  DetilPage({required this.index,required this.id});

  @override
  State<DetilPage> createState() => _DetilPageState();
}

class _DetilPageState extends State<DetilPage> {

  @override
  Widget build(BuildContext context) {
    final val= Provider.of<Moviesprovider>(context);
    print(val.movieslist!.item[widget.index].id);
    return  Scaffold(
      backgroundColor: Colors.black54,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
     body: CustomScrollView(
       slivers: [
         Sliverappbar(context),
        SliverLayoutBuilder(builder: (p0, p1) {
        return SliverFillRemaining(
        child: Bodywidget(widget.index),
         );
        }
        )
       ],
     ),
    );
  }
}

