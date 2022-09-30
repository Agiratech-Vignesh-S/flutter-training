import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
List<String> countries = <String>['New York', 'India', 'USA', 'Norway'];
class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dropdownValue = countries.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
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
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
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
