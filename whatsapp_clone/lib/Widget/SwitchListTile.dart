import 'package:flutter/material.dart';

class SwitchlistTile extends StatelessWidget {

  final String title;
  final String subtitle;
  Function value;
   SwitchlistTile({super.key, required this.title, required this.subtitle,required this.value});

  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(
      onChanged: value(),
      activeColor: Colors.green,
      title: Text(title),
      subtitle: Text(subtitle), value: false,
    );
  }
}