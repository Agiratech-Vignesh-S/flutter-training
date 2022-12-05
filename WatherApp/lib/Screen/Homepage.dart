import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watherapp/Provider/Service.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherService>(context, listen: false).getWeather("india");
    Provider.of<WeatherService>(context, listen: false).loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    final val1 = Provider.of<WeatherService>(context);
    var que;
    DateTime today = DateFormat("yyyy-MM-dd hh:mm").parse(
        val1.weather.datetime);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: DropdownButton(
            iconEnabledColor: Colors.white,
            underline: SizedBox(),
            dropdownColor: Colors.white,
            elevation: 0,
            alignment: Alignment.center,
            value: que,
            onChanged: (que) {
              if (que != null) {
                setState(() {
                  val1.getWeather(que.toString());
                  val1.query = que;
                });
              }
            },
            items: val1.countries?.data!.map((e) {
              return DropdownMenuItem<String>(
                  value: (e.country),
                  child: Text(e.country!));
            }).toList(),
            hint: Text("${val1.query}",style: TextStyle(color: Colors.white,fontSize: 35)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
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
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ))),
                    Container(
                        height: 100,
                        width: 100,
                        child: FittedBox(
                            child: Text(
                              "${val1.weather.condition}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
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
