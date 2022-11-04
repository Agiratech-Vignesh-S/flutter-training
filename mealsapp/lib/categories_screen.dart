import 'package:flutter/material.dart';
import 'package:mealsapp/dum_data.dart';

import './dum_data.dart';
import 'catrgorie_item.dart';

class categ_screen extends StatelessWidget {
  const categ_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
// ignore: sort_child_properties_last
      children: Dummy_Categories.map(
              (data) => CategoryItem(color: data.color, title: data.title))
          .toList(),
// ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
