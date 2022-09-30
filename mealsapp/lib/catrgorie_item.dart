import 'package:flutter/material.dart';

class Categorie_item extends StatelessWidget {
  // const Categorie_item({super.key});
  Color color;
  String title;

  Categorie_item(this.color, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.6),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
