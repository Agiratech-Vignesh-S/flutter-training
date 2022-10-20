import 'package:flutter/material.dart';
import 'package:mealsapp1/Screens/categories_screen.dart';
import 'package:mealsapp1/Screens/favorites_screen.dart';

class Tabs_screen extends StatefulWidget {
  const Tabs_screen({Key? key}) : super(key: key);

  @override
  State<Tabs_screen> createState() => _Tabs_screenState();
}

class _Tabs_screenState extends State<Tabs_screen> {
  List<Map<String ,Object>> pages=[
    {'page':CategoriesScreen() ,'title':'Categories'},
    {'page':favorites_screen(),'title':'favorites'}

  ];

  int selectindexpage=0;

  void selectpage(int index){
    setState(() {
      selectindexpage=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(pages[selectindexpage]['title'].toString()),
        ),
        body: pages[selectindexpage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectindexpage,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: selectpage,
        backgroundColor: Theme.of(context).backgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star),
            label: "favorites",
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category),
            label: "category",
          ),
        ],
      ),
    );
  }
}
