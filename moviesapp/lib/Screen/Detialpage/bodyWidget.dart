import 'package:flutter/material.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';

import '../../Widget/youtubeplayer.dart';
import '../../imgurl.dart';

class Bodywidget extends StatefulWidget {
 int index;
 Bodywidget(this.index);
  @override
  State<Bodywidget> createState() => _BodywidgetState();
}

class _BodywidgetState extends State<Bodywidget> {
  @override
  Widget build(BuildContext context) {
    final val= Provider.of<Moviesprovider>(context);
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          val.top==80.0?
            Container(
            width: double.infinity,
            height: 450,
              decoration: BoxDecoration(
          image: DecorationImage(
             image: NetworkImage("https://image.tmdb.org/t/p/w185/${val.movieslist?.item[widget.index].posterPath}"),
                  fit: BoxFit.fill
          ),)
            ):SizedBox(height: 10,),
          //    VideoApp(),
          SizedBox(height: 7,),
          Container(
            height: 50,
            child: Row(
              children: [
                Chip(label:Text("IMDB ${val.movieslist?.item[widget.index].voteAverage}",style: TextStyle(fontSize: 17)),
                  backgroundColor: Colors.amber,
                ),
                SizedBox(width: 10,),
                Icon(Icons.star,size: 23,color: Colors.yellow),
                Text(" ${val.movieslist?.item[widget.index].voteAverage}",style: TextStyle(fontSize: 23,color: Colors.yellow,fontWeight:FontWeight.bold)),
                Text(" (${val.movieslist?.item[widget.index].popularity!.round()}K reviews)",style: TextStyle(color: Colors.white,fontSize: 18),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(child: Text("${val.movieslist?.item[widget.index].title}",style: TextStyle(color: Colors.white,fontSize: 23),textAlign: TextAlign.center)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("${val.movieslist?.item[widget.index].overview}",style: TextStyle(color: Colors.white,fontSize: 20),),
          )
        ],
      ),
    );
  }
}
