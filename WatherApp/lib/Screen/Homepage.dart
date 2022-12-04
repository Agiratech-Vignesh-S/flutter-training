import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watherapp/Provider/Service.dart';
import 'package:watherapp/model/Weather.dart';

import '../Search.dart';

class Homepage extends StatefulWidget with ChangeNotifier {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    final val1 = Provider.of<WeatherService>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: TextButton(
            child: Text("${val1.query}",
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.density_medium_outlined))
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${val1.image()}"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                      child: Text(
                    "Today",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  )),
                  Center(
                      child: Container(
                          height: 200,
                          width: 200,
                          child: FittedBox(
                              child: Text(
                            "${val1.weather.temperatureC}",
                            style: const TextStyle(color: Colors.white, fontSize: 40),
                          )))),
                  Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: FittedBox(
                              child: Text(
                                "${val1.weather.condition}",
                                style: const TextStyle(color: Colors.white, fontSize: 40),
                              ))))
                ],
              ),
            ),
          ],
        ));
  }
}
