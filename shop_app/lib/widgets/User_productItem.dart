import 'package:flutter/material.dart';

class UserProduct_item extends StatelessWidget {
 final String title;
 final String imagUrl;

  const UserProduct_item({super.key, required this.title, required this.imagUrl});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar
        (backgroundImage:
      NetworkImage(imagUrl)
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Theme.of(context).errorColor,)),
          ],
        ),
      ),
    );
  }
}
