import 'package:flutter/material.dart';

import '../Widget/Meal_item.dart';
import '../models/meal.dart';

class Favorites_screen extends StatelessWidget {

  final List<Meal>favoriteMeals;

  Favorites_screen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Scaffold(
        body: Center(child: Text('You have no favorites')
        )
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,

          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}
