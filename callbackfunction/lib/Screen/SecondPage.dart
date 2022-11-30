import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const routeName = '/second_screen';
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text("second paga"),
            expandedHeight: 190,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://cdn.pixabay.com/photo/2012/05/29/00/43/car-49278__340.jpg",fit: BoxFit.fill,),
            title: const Text("second paga",style: TextStyle(color: Colors.blue)),
            ),
            actions: [
        IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/third_screen');
          }, icon: const Icon(Icons.arrow_forward_rounded,color: Colors.green ,size: 35,),
        )
            ],
          ),
          const SliverFillRemaining(
            child: Center(
              child: Text("Second page"),
            ),
          )
        ],
      ),
    );
  }
}