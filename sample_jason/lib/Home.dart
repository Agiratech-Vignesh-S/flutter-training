import 'package:flutter/material.dart';
import 'package:sample_jason/Tab/Address_tab.dart';
import 'package:sample_jason/Tab/College.dart';
import 'package:sample_jason/Tab/Shape.dart';
import 'package:sample_jason/Tab/Student.dart';
import 'package:sample_jason/Tab/Bakery.dart';
import 'package:sample_jason/Tab/page.dart';
import 'package:sample_jason/model/Collage_model.dart';
import 'Tab/Product.dart';
import 'Tab/Photo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text("json"),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: TabBar(
                // onTap: (value) => popupmenu(value),
                //controller: null,
                isScrollable: true,

                indicatorColor: Colors.white,
                indicatorWeight: 4,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Container(
                    width: 60,
                    child: const Tab(
                      child: Text(
                        "Student",
                      ),
                    ),
                  ),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "Photos",
                        ),
                      )),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "Product",
                        ),
                      )),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "address",
                        ),
                      )),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "Shape",
                        ),
                      )),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "Bakery",
                        ),
                      )),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "page",
                        ),
                      )),
                  Container(
                      width: 60,
                      child: const Tab(
                        child: Text(
                          "College",
                        ),
                      )),
                ],
              ),
            ),

            Flexible(
                flex: 1,
                child: TabBarView(
                  children: [
                    Student(),
                    Photo(),
                    Product(),
                    Address_tab(),
                    Shape(),
                    Bakery(),
                    Page_tab(),
                    College_Tab()
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
