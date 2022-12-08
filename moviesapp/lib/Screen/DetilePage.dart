import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/moviesprovider.dart';

class DetilPage extends StatelessWidget {
  static const routeName = '/Detial_screen';
  static const routName='/home_page';
  int index;
  DetilPage({required this.index});

  @override
  Widget build(BuildContext context) {
    final val= Provider.of<Moviesprovider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
      AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushNamed('/home_page');
          // Navigator.of(context).pop();
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
            Container(
            width: double.infinity,
            height: 450,
              decoration: BoxDecoration(
          image: DecorationImage(
             image: NetworkImage("https://image.tmdb.org/t/p/w185/${val.movieslist?.item[index].posterPath}"),
                  fit: BoxFit.fill
          ),)
            ),
             SizedBox(height: 7,),
             Container(
               height: 50,
               child: Row(
                 children: [
                   Chip(label:Text("IMDB ${val.movieslist?.item[index].voteAverage}",style: TextStyle(fontSize: 17)),
                     backgroundColor: Colors.amber,
                   ),
                   SizedBox(width: 10,),
                   Icon(Icons.star,size: 23,color: Colors.yellow),
                   Text(" ${val.movieslist?.item[index].voteAverage}",style: TextStyle(fontSize: 23,color: Colors.yellow,fontWeight:FontWeight.bold)),
                     Text(" (${val.movieslist?.item[index].popularity!.round()}K reviews)",style: TextStyle(color: Colors.white,fontSize: 18),),
                 ],
               ),
             ),
             SizedBox(
               height: 10,
             ),
             Container(
               child: Center(child: Text("${val.movieslist?.item[index].title}",style: TextStyle(color: Colors.white,fontSize: 23),textAlign: TextAlign.center)),
             ),
             SizedBox(
               height: 10,
             ),
             Container(
               child: Text("${val.movieslist?.item[index].overview}",style: TextStyle(color: Colors.white,fontSize: 20),),
             )
           ],
         ),
       ),
     ),
    );
  }
}
