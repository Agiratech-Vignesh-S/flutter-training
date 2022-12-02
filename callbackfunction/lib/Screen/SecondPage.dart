import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const routeName = '/second_screen';
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
            title:  Text("second paga"),
            actions: [
        IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/third_screen');
          }, icon:  Icon(Icons.arrow_forward_rounded,color: Colors.green ,size: 35,),
        )
            ],
          ),
      body: SizedBox(
        height: 200,
        child: ReorderableListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            for (int index = 0; index < _items.length; index++)
              ListTile(
                key: Key(index.toString()),
                title: Text('Item ${_items[index]}'),
              ),
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}