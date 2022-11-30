import 'package:flutter/material.dart';
import 'package:httprequest/Screens/Edit_screen.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:httprequest/model/Add_User.dart';
import 'package:provider/provider.dart';
import 'package:httprequest/model/CoustomException.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<User>>? futureUser;
  var isLoading = true;
  void initState() {
    var isLoading = true;
    Provider.of<User_provider>(context, listen: false).fetchusers();
    isLoading = false;
    super.initState();
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
    final val = Provider.of<User_provider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("http request"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Edit_screen.routeName,
                      arguments: {'id': '', 'isAdd': true});
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
          itemCount: val.Users_.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(
                  "name :  "
                  "${val.Users_[index].last_name}",
                ),
                subtitle: Text("email : ${val.Users_[index].email}"),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            final id = val.Users_[index].id.toString();
                            Navigator.of(context).pushNamed(
                                Edit_screen.routeName,
                                arguments: {'id': id, 'isAdd': false});
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          try {
                            await val.deleteUser(val.Users_[index].id);
                          } on OwnHttpException catch (error) {
                            print("error $error");
                            showMessage(context, error.message);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
