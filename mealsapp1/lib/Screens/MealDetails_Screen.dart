import 'package:flutter/material.dart';
import 'package:mealsapp1/dummy_data.dart';

class MealDetails_screen extends StatelessWidget {
  static const routeName ='/MealDetails_screen';

  final Function toggleFavorite;
  final Function isfavorite;

  MealDetails_screen(this.toggleFavorite,this.isfavorite);

  Widget bulidSectionTitle(BuildContext context,String text){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: Theme.of(context).textTheme.titleMedium,),
    );
  }

  Widget buildContainer(Widget child){
   return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 230,
      child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final MealId=ModalRoute.of(context)!.settings.arguments as String;
    final SelectedMeal= DUMMY_MEALS.firstWhere((Meal) => Meal.id==MealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('$MealId'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            bulidSectionTitle(context,'ingredients'),

            buildContainer(ListView.builder(itemBuilder: (ctx,index)=>Card(
                color: Theme.of(context).accentColor,
                child: Text(SelectedMeal.ingredients[index]),
              ),
              itemCount:SelectedMeal.ingredients.length,
              ),
            ),
            bulidSectionTitle(context, 'steps'),
            buildContainer(ListView.builder(itemBuilder:(context,index)=>ListTile(
            leading: CircleAvatar(
              child: Text('# ${(index+1)}'),
            ),
              title: Text(SelectedMeal.steps[index]),
            ),
              itemCount: SelectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfavorite(MealId)?Icons.star :Icons.star_border),
        onPressed:toggleFavorite(MealId),
      ),
    );
  }
}
