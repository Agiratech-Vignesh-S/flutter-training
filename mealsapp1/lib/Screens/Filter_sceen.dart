import 'package:flutter/material.dart';

import 'package:mealsapp1/Widget/Main_drawer.dart';

class Filter_screen extends StatefulWidget {
  static const routeName='/filters';

  final Function setFilters;
  Map<String ,bool>CurrentFilter;

  Filter_screen({ required this.CurrentFilter, required this.setFilters});


  @override
  State<Filter_screen> createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {
  bool _GlutenFree=false;
  bool _Vegan= false;
  bool _Vegetarian=false;
  bool _LactoseFree=false;

  Widget buildSwitchtile(
      String title,
      String description,
      bool currentvalue,
      Function updatevalue,
      ){
    return SwitchListTile(value: currentvalue,
      onChanged:updatevalue as Function(bool),
      title: Text(title),
      subtitle: Text(description),
    );
  }
@override
  void initState() {
    // TODO: implement initState
  _GlutenFree=widget.CurrentFilter['GlutenFree'] as bool;
  _Vegan=widget.CurrentFilter['Vegan'] as bool;
  _Vegetarian=widget.CurrentFilter['Vegetarian'] as bool ;
  _LactoseFree=widget.CurrentFilter['LactoseFree']as bool ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text("Filter"),
           actions: <Widget>[
             IconButton(onPressed: (){
             final  SelectedFilter={
               'GlutenFree' : _GlutenFree,
               'Vegan': _Vegan,
               'Vegetarian':_Vegetarian,
               'LactoseFree':_LactoseFree,
                };
               widget.setFilters(SelectedFilter)
             ;}, icon: Icon(Icons.save))
           ],
         ),
      drawer: Main_drawer(),
      body : Column(
        children: [
         Container(
           child: Text("Adiust your meal selecion",style: Theme.of(context).textTheme.titleMedium,),
         ),
          Expanded(child: ListView(
            children: [
            buildSwitchtile(
                "Gluten Free",
                "Only include Gluten-Free meals",
                _GlutenFree,
                    (newValue){
              setState(() {
                _GlutenFree=newValue;
              });
            }),
              buildSwitchtile(
                  "Lactose Free",
                  "Only include Lactose-Free meals",
                  _LactoseFree,
                      (newValue){
                    setState(() {
                      _LactoseFree=newValue;
                    });
                  }),
              buildSwitchtile(
                  "Vegetarian",
                  "Only include Vegetarian meals",
                  _Vegetarian,
                      (newValue){
                    setState(() {
                      _Vegetarian=newValue;
                    });
                  }),
              buildSwitchtile(
                  "Vegan",
                  "Only include Vegan meals",
                  _Vegan,
                      (newValue){
                    setState(() {
                      _Vegan=newValue;
                    });
                  })
            ],
          ))
        ],
      )
    );
  }
}
