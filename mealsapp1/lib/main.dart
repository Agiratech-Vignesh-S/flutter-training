import 'package:flutter/material.dart';

import 'package:mealsapp1/Screens/MealDetails_Screen.dart';
import 'package:mealsapp1/Screens/Meals_screen.dart';
import 'package:mealsapp1/Screens/Tabs_screen.dart';
import 'Screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => const Tabs_screen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetails_screen.routeName : (ctx)=> MealDetails_screen(),
      },
 //      onGenerateRoute:((settings){
 // MaterialPageRoute(builder: (context)=> CategoryMealsScreen());
 //      })
    );
  }
}
