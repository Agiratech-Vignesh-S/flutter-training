import 'package:flutter/material.dart';
import 'package:sample_jason/provider/Photo_model.dart';
import 'package:provider/provider.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  void initState() {
    super.initState();
    Provider.of<Provider1>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Provider1>(
            builder: (context, item, child) => (item.product_list.isEmpty)
                ? CircularProgressIndicator()
                : GridView.builder(
                    itemCount: item.product_list.length,
                    itemBuilder: (context, index) => Card(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        child: GestureDetector(
                          child: Image.network(
                          item.product_list[index].url,
                            fit: BoxFit.cover,
                          ),
                        ),
                        footer: GridTileBar(
                          title: Text(item.product_list[index].title),
                          subtitle: Text(item.product_list[index].id),
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    )),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  )));
  }
}
