import 'package:flutter/material.dart';
import 'package:mealsapp1/Screens/categories_screen.dart';
import 'package:mealsapp1/Screens/favorites_screen.dart';
import 'package:mealsapp1/Widget/Main_drawer.dart';
import 'package:mealsapp1/main.dart';
import '../models/meal.dart';

class Tabs_screen extends StatefulWidget {
  final List<Meal>favoriteMeals;

  Tabs_screen(this.favoriteMeals);

  @override
  State<Tabs_screen> createState() => _Tabs_screenState();
}

class _Tabs_screenState extends State<Tabs_screen> {
   late List<Map<String ,Object>> _pages;

  int selectindexpage=0;

  void selectpage(int index){
    setState(() {
      selectindexpage=index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages=[
      {'page':CategoriesScreen() ,'title':'Categories'},
      {'page':Favorites_screen(widget.favoriteMeals),'title':'favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(_pages[selectindexpage]['title'].toString()),
        ),
        drawer: Main_drawer(),
        body: _pages[selectindexpage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectindexpage,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: selectpage,
        backgroundColor: Theme.of(context).backgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category),
            label: "Category",
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star),
            label: "favorites",
          ),
        ],
      ),
    );
  }
}
