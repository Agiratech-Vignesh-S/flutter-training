import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> countries = <String>['New York', 'India', 'USA', 'Norway'];

class SecondScreen extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  State<SecondScreen> createState() => _MyAppState();
}

class _MyAppState extends State<SecondScreen> {
  String dropdownValue = countries.first;
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
          },),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Find events in",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 20),
                      child: Container(
                        width: 150,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          elevation: 16,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: countries
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        ("Popular in New York"),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 15,
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Card(

                         // elevation: 10,
                          // width: 150,
                          // height: 140,
                          child: Container(
                            // width: 200,
                            child: Positioned.fill(
                              // top: 20,
                              // right: 10,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    child: Image(
                                        image:
                                            AssetImage("assets/sam.jpg")),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Card(child: Text("Free"))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat.yMMMEd().format(now),style: TextStyle(color: Colors.deepOrange),),
                              Title(
                                  color: Colors.black,
                                  child:
                                      Text("Certified saturday #1 party in New York")),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    // padding: EdgeInsets.only(l),
                                    child: Text(
                                      "Katra",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.blue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 110),
                                    child: IconButton(
                                        icon: Icon(Icons.favorite_rounded),
                                        onPressed: () {}),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.share), onPressed: () {}),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),Column(
              children: [
                Card(
                  elevation: 15,
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Card(

                          // elevation: 10,
                          // width: 150,
                          // height: 140,
                          child: Container(
                            // width: 200,
                            child: Positioned.fill(
                              // top: 20,
                              // right: 10,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    child: Image(
                                        image:
                                        AssetImage("assets/sam.jpg")),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Card(child: Text("Free"))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat.yMMMEd().format(now),style: TextStyle(color: Colors.deepOrange),),
                              Title(
                                  color: Colors.black,
                                  child:
                                  Text("Certified saturday #1 party in New York")),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    // padding: EdgeInsets.only(l),
                                    child: Text(
                                      "Katra",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.blue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 110),
                                    child: IconButton(
                                        icon: Icon(Icons.favorite_rounded),
                                        onPressed: () {}),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.share), onPressed: () {}),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
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
