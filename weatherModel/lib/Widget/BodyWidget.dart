import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathermodel/provider/Provider.dart';

@override
Widget Bodywidgt(BuildContext context) {
  final val1 = Provider.of<WeatherProvider>(context);
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(val1.top==80.0?val1.image():"https://htmlcolorcodes.com/assets/images/colors/orange-color-solid-background-1920x1080.png"),
              fit: BoxFit.cover
          ),
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
            Container(
                height: 200,
                width: 200,
                child: FittedBox(
                    child: Text("${val1.weather.temperatureC}°",
                      style: const TextStyle(
                          color: Colors.white, fontSize: 40),
                    ))),
            Container(
                height: 100,
                width: 100,
                child: FittedBox(
                    child: Text(
                      val1.weather.condition,
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
  );
}