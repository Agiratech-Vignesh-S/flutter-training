import 'package:flutter/material.dart';
import 'package:moviesapp/Widget/StackWidget.dart';
import 'package:moviesapp/imgurl.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Router/route.dart';
import '../Widget/Autocompleted.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final asset = 'assets/video.mp4';
  @override
  void initState() {
    super.initState();
  final val= Provider.of<Moviesprovider>(context,listen: false);
    val.loadmovieslist();
  }
  @override
  Widget build(BuildContext context) {
    final val= Provider.of<Moviesprovider>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
   body: SafeArea(
     child: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(padding: const EdgeInsets.symmetric(vertical: 18),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: const [
                     Text("Hello Mass!",style: TextStyle(color: Colors.white,fontSize: 20),),
                     Text("Book your favorite movie",style: TextStyle(color: Colors.white),),
                   ],
                 ),
                  CircleAvatar(
                   backgroundImage: NetworkImage("https://cdn.vectorstock.com/i/preview-1x/38/73/devil-icon-vector-5053873.jpg"),
                 )
               ],
             ),
             ),
             Container(
               decoration: BoxDecoration(
                 color: Colors.grey,
                 borderRadius: BorderRadius.circular(10)
               ),
               height: 60,
               child: Row(
                 children: [
                   IconButton(onPressed: (){
                     val.getMovie(val.query);
                   }, icon: const Icon(Icons.search,color: Colors.white,size: 35,)),
                   Container(
                     width: 300,
                     child: Autocompleted(context),
                   )
                 ],
               ),
             ),
             const SizedBox(height: 30,),
              Text("Feature movie",style: TextStyle(color: Colors.white,fontSize: 26),),
             const SizedBox(height: 30,),
             Container(
               height: 450,
                 child: ListView.builder(
               scrollDirection: Axis.horizontal,
                 itemBuilder: ((context, index) {
                   val.indes=index;
                   return StackWidget(context,index);
                 }),
                 itemCount: val.movieslist?.item.length))
           ],
         ),
       ),
     ),
   ),
    );
  }
}
