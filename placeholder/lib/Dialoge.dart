import 'package:flutter/material.dart';
import 'package:placeholder/model/AlbumModel.dart';
import 'package:placeholder/model/ErrorMessage.dart';
import 'package:placeholder/provider/Albumprovider.dart';
import 'package:provider/provider.dart';

class Dialoge{

final TextEditingController titlecontroller = TextEditingController();
final TextEditingController idcontroller = TextEditingController();

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

  Future<void> showdialogue(BuildContext rcontext, int? ids) async {
    final value_ = Provider.of<AlbumProvider>(rcontext,listen: false);
    final albumdataIndex = value_.albumdata!.details!.indexWhere((element) => element.id == ids);
    int? exisId;
    String? existtitle;
    if (ids != 0) {
      existtitle = value_.albumdata!.details![albumdataIndex].title;
      exisId = value_.albumdata!.details![albumdataIndex].id;
    }
    showDialog(
        context: rcontext,
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