import 'package:flutter/material.dart';

class Four extends StatelessWidget {
  static const routeName = '/Four_screen';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Four Screen"),
    centerTitle: true,
    ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 0),
                color: Colors.cyan,
                width: 200,
                height: 200,
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25).copyWith(top: 60),
                color: Colors.green,
                width: 200,
                height: 200,
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 120),
                color: Colors.redAccent,
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              bottom: 130,
               left: 0,
              right: 0,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage("https://openthemagazine.com/wp-content/uploads/2015/11/secret-1.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
