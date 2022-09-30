import 'package:flutter/material.dart';
import 'secondpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _MyAppState();
}

class _MyAppState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text('Hello',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                      textAlign: TextAlign.start),
                ),
              ],
            ),
            // SizedBox(height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Let's find your next unforgettable event."),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Choose a location below to get started."),
                ),
              ],
            ),

            const Image(image: AssetImage('assets/Art.png')),
            Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.deepOrange)),
                child: const Text('pick a city'),
              ),
            ),
            //                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue))),
            Container(
                padding: const EdgeInsets.all(6),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.my_location),
                    TextButton(
                      onPressed: () {},
                      child: Text('Use my current location'),
                    ),
                  ],
                )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black54),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black54),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_sharp, color: Colors.black54),
              label: 'favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_screen, color: Colors.black54),
              label: 'tag',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black54),
              label: 'account',
            ),
          ],
        ),
      ),
    );
  }
}
