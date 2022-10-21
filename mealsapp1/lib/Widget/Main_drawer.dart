
import 'package:flutter/material.dart';
import 'package:mealsapp1/Screens/Filter_sceen.dart';

class Main_drawer extends StatelessWidget {
  const Main_drawer({Key? key}) : super(key: key);
  Widget buildListTile(String title,IconData icon,VoidCallback handler){
    return  ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(title,style: TextStyle(fontFamily: 'RobotoCondensed',fontSize: 24,fontWeight: FontWeight.bold),),
      onTap: handler ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Colors.amberAccent,
            child: Text("Cooking up!",style: TextStyle(fontWeight: FontWeight.w900),),
          ),
          SizedBox(height: 20,),
          buildListTile("Meals", Icons.restaurant,(){
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile("Filter", Icons.settings,
              (){
            Navigator.of(context).pushNamed(Filter_screen.routeName);
              }
          )
        ],
      ),
    );
  }
}
