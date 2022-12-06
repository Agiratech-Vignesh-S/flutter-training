import 'package:flutter/material.dart';

class RowLIsttile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final Function ontab;

  const RowLIsttile({super.key, required this.title, required this.subtitle, required this.icon, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListTile(
            onTap: ontab(),
            leading: icon,
            title:  Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(subtitle),
          ),
        ),
      ],
    );
  }
}
