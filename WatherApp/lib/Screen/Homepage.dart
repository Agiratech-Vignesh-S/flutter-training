import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watherapp/Autocomplet.dart';
import 'package:watherapp/Provider/Service.dart';
import 'package:watherapp/model/Weather.dart';
import 'package:intl/intl.dart';
import '../Search.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WeatherService>(context,listen: false).getWeather("india");
    Provider.of<WeatherService>(context,listen: false).loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    final val1 = Provider.of<WeatherService>(context);
    DateTime today = DateFormat("yyyy-MM-dd hh:mm").parse(val1.weather.datetime);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: val1.change? AppBar(
          title: Text("${val1.query}"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  setState((){
                    val1.change=false;
                  });
                },
                icon: const Icon(Icons.search))
          ],
        ):Autocompleted(context),
        body: Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${val1.image()}"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     const Text(
                      "Today",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    Text("${DateFormat("E,dd MMM").format(today)}"),
                    Container(
                        height: 200,
                        width: 200,
                        child: FittedBox(
                            child: Text(
                          "${val1.weather.temperatureC}",
                          style: const TextStyle(color: Colors.white, fontSize: 40),
                        ))),
                    Container(
                        height: 100,
                        width: 100,
                        child: FittedBox(
                            child: Text(
                              "${val1.weather.condition}",
                              style: const TextStyle(color: Colors.white, fontSize: 40),
                            )
                        )
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
