import 'package:flutter/material.dart';

class SwitchlistTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final bool value;
  Function onchange;

   SwitchlistTile({super.key, required this.title, required this.subtitle,required this.onchange,required this.value});

  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(

      onChanged: onchange(),
      activeColor: Colors.green,
      title: Text(title),
      subtitle: Text(subtitle), value: value,
    );
  }
}