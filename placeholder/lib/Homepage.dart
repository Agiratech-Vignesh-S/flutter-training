import 'package:flutter/material.dart';
import 'package:placeholder/provider/Albumprovider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AlbumProvider>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<AlbumProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("placeholder api"),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: value.albumdata?.Details!.length,
          itemBuilder: (context, index) => Card(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: Text(value.albumdata!.Details![index].title.toString()),
              footer: GridTileBar(
                title: Text(value.albumdata!.Details![index].id.toString()),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                backgroundColor: Colors.black54,
              ),
            ),
          )),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 6,
          ),
        ));
  }
}
