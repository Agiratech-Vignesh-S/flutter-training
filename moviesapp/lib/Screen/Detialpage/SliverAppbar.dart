
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';

import '../../Widget/youtubeplayer.dart';

Widget Sliverappbar(BuildContext context){
  final movieprovider= Provider.of<Moviesprovider>(context);
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    expandedHeight: 200.0,
    floating: true,
    pinned: true,
    automaticallyImplyLeading: true,
    flexibleSpace: LayoutBuilder(builder: (p0, p1) {
      movieprovider.top=p1.biggest.height;
      print(movieprovider.top);
      print(movieprovider.videokey());
      return FlexibleSpaceBar(
          background: Visibility(
              visible: movieprovider.videokey()!=null,
              child: YoutubeVideo(movieprovider.videokey()!)),
          );
    },
    ),
  );
}