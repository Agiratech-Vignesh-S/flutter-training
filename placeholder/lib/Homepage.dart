import 'package:flutter/material.dart';
import 'package:placeholder/Dialoge.dart';
import 'package:placeholder/model/AlbumModel.dart';
import 'package:placeholder/model/ErrorMessage.dart';
import 'package:placeholder/provider/Albumprovider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late Future<Album> futurealbum;
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futurealbum =
        Provider.of<AlbumProvider>(context, listen: false).factAlbum();
  }

  @override
  Widget build(context) {
    final value = Provider.of<AlbumProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("placeholder api"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await Dialoge().showdialogue(context,0);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
            child: FutureBuilder(
                future: futurealbum,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: value.albumdata?.details!.length,
                        itemBuilder: (context, index) => Card(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GridTile(
                                footer: GridTileBar(
                                  title: Text(value
                                      .albumdata!.details![index].id
                                      .toString()),
                                  leading: IconButton(
                                    onPressed: () async {
                                      int ids = value.albumdata!.details![index].id!;
                                      await Dialoge().showdialogue(context,ids);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () async{
                                      try{
                                        int? ids = value.albumdata!
                                            .details![index].id;
                                       await value.deleteUser(ids!);
                                      }on OwnHttpException catch(e){
                                         Dialoge().showMessage(context,e.message);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  backgroundColor: Colors.black54,
                                ),
                                child: Text(value
                                    .albumdata!.details![index].title
                                    .toString()),
                              ),
                            )),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 6,
                        ));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Failed to create album."));
                  }
                  return const CircularProgressIndicator();
                })),
        )
    );
  }


}
