import 'package:flutter/material.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';
Widget StackWidget(BuildContext context, int index){
  final val= Provider.of<Moviesprovider>(context);
  return GestureDetector(
    onTap: ()async{
      print(val.movieslist?.item[index].id);
     await val.loadVideo(val.movieslist?.item[index].id as int);
      Navigator.of(context).pushNamed('/Detial_screen',arguments: {'index':index,'id':val.movieslist?.item[index].id});
    },
    child: Stack(
      children: [
        Container(
            width: 300,
            height: MediaQuery.of(context).size.width*5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://image.tmdb.org/t/p/w185/${val.movieslist?.item[index].posterPath}"),
         fit: BoxFit.cover),
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(Icons.star,size: 20,color: Colors.yellow),
                      Text(" ${val.movieslist?.item[index].voteAverage}",style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight:FontWeight.bold)),
                     Spacer(),
                      Chip(label:Text("IMDB ${val.movieslist?.item[index].voteAverage}",style: TextStyle(fontSize: 17)),
                      backgroundColor: Colors.yellow,
                      )
                    ],
                  ),
                ),
              ],
            )
        )
      ],
    ),
  );
}