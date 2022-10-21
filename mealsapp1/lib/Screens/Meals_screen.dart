import 'package:flutter/material.dart';
import '../Widget/Meal_item.dart';
import '../dummy_data.dart';
import 'package:mealsapp1/models/meal.dart';



class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal>availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal>displayedMeal;
  var loadedIiniData=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies(){
  if(!loadedIiniData){
  final routeArgs =
  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  categoryTitle = routeArgs['title']!;
  final categoryId = routeArgs['id'];
  displayedMeal = DUMMY_MEALS.where((meal) {
  return meal.categories.contains(categoryId);
  }).toList();
  super.didChangeDependencies();
  loadedIiniData=true;
  }
    // TODO: implement didChangeDependencies

  }

  void removemeal(String MealId){
    setState(() {
     displayedMeal.removeWhere((meal) => meal.id==MealId);
    });
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            removeitem: removemeal,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
