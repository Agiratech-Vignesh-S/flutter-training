import 'package:flutter/material.dart';
import 'package:mealsapp1/Screens/Filter_sceen.dart';

import 'package:mealsapp1/Screens/MealDetails_Screen.dart';
import 'package:mealsapp1/Screens/Meals_screen.dart';
import 'package:mealsapp1/Screens/Tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal>availableMeal=DUMMY_MEALS;
  List<Meal>_favorites=[];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactos']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favorites.removeAt(existingIndex);
      });
    } else {
      _favorites.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
    }
  }


  bool isMealfavorite(String id){
    return _favorites.any((meal) => meal.id==id);
  }

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
        '/': (ctx) =>  Tabs_screen(_favorites),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(availableMeal),
        MealDetails_screen.routeName : (ctx)=> MealDetails_screen(toggleFavorite,isMealfavorite),
        Filter_screen.routeName : (ctx)=> Filter_screen(CurrentFilter:filters ,setFilters:setFilters)
      },
 //      onGenerateRoute:((settings){
 // MaterialPageRoute(builder: (context)=> CategoryMealsScreen());
 //      })
    );
  }
}
