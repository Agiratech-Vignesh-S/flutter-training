import 'package:flutter/material.dart';
import 'package:placeholder/model/Albummodel.dart';
import 'package:placeholder/model/errormessage.dart';
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
        Provider.of<AlbumProvider>(context, listen: false).factalbum();
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          textColor: Colors.blue,
          label: 'OKAY',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<AlbumProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("placeholder api"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await showdialogue(context, value, 0);
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
                        itemCount: value.albumdata?.Details!.length,
                        itemBuilder: (context, index) => Card(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GridTile(
                                child: Text(value
                                    .albumdata!.Details![index].title
                                    .toString()),
                                footer: GridTileBar(
                                  title: Text(value
                                      .albumdata!.Details![index].id
                                      .toString()),
                                  leading: IconButton(
                                    onPressed: () async {
                                      int ids = value.albumdata!.Details![index].id!;
                                      await showdialogue(context, value, ids);
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
                                            .Details![index].id;
                                       await value.deleteUser(ids!);
                                      }on OwnHttpException catch(e){
                                        showMessage(context,e.message);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  backgroundColor: Colors.black54,
                                ),
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
                    return Center(child: Text("Failed to create album."));
                  }
                  return CircularProgressIndicator();
                }))
        )
    );
  }

  Future<void> showdialogue(
      BuildContext context, AlbumProvider value_, int? ids) async {
    final albumdataIndex =
        value_.albumdata!.Details!.indexWhere((element) => element.id == ids);
    int? exisId;
    String? existtitle;
    if (ids != 0) {
      existtitle = value_.albumdata!.Details![albumdataIndex].title;
      exisId = value_.albumdata!.Details![albumdataIndex].id;
    }
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: idcontroller,
                    decoration: InputDecoration(
                      labelText: (ids != 0) ? exisId.toString() : null,
                      hintText: 'Enter id',
                    ),
                  ),
                  TextField(
                    controller: titlecontroller,
                    decoration: InputDecoration(
                      labelText: existtitle,
                      hintText: 'Enter Title',
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: ()  async{
                          if (ids == 0) {
                            try {
                              Detail albumnew = Detail(title: titlecontroller.text,);
                           await value_.createAlbum(albumnew, idcontroller.text.toString());
                            }on OwnHttpException catch(c){
                              showMessage(context,c.message);
                            }
                            Navigator.of(context).pop();
                          }
                          else if(ids!=null){
                            try {
                            Detail albumdata = Detail(id: int.parse(idcontroller.text),
                                    title: titlecontroller.text);
                            await value_.updateAlbum(albumdata, ids);
                            idcontroller.text = '';
                            titlecontroller.text = '';
                            }on OwnHttpException catch(f){
                              showMessage(context,f.message);
                            }
                            Navigator.of(context).pop();
                          }},
                        child: Text(ids == 0 ? 'Add' : 'Update'))
                  ],
                )
              ],
            )));
  }
}
