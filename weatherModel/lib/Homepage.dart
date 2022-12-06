import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathermodel/Widget/BodyWidget.dart';
import 'package:weathermodel/Widget/SliverAppbar.dart';
import 'package:weathermodel/provider/Provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).getWeather("india");
    Provider.of<WeatherProvider>(context, listen: false).loadCountries();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
       resizeToAvoidBottomInset: false,
      body:CustomScrollView(
            slivers: [
              SliverAppBarWidget(context),
              SliverLayoutBuilder(builder: (p0, p1) {
                return SliverFillRemaining(
                    fillOverscroll: false,
                    child: Bodywidgt(context));
              },),
              ]
      )
    );
  }
}
