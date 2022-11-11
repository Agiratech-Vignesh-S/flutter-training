import 'package:flutter/material.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:httprequest/model/Add_User.dart';
import 'package:provider/provider.dart';

class Add_prodect extends StatefulWidget {
   Add_prodect({Key? key}) : super(key: key);

  @override
  State<Add_prodect> createState() => _Add_prodectState();
}
class _Add_prodectState extends State<Add_prodect> {
  Map initValue = {
    'First_name': '',
    'Email': '',
    'password': '',
    'last_name': ''
  };
  User user_add = User(
      id: '',
      first_name: '',
      last_name: '',
      email: '',
      password: '');

  final _form = GlobalKey<FormState>();
  Future<void>_save()async{
    print("vfv");
    final valid=_form.currentState!.validate();
    if(!valid){
      return;
    }
    _form.currentState!.save();
    Provider.of<User_provider>(context, listen: false).add_user(user_add);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Card(
        child: Column(
          children: [
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First_name'),
                    obscureText: true,
                    initialValue: initValue['name'],
                    // controller: _passwordController,
                    onSaved: (value) {
                      user_add = User(id: user_add.id,
                          first_name: value,
                          last_name: user_add.last_name,
                          email: user_add.email,
                          password: user_add.password);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First_name'),
                    obscureText: true,
                    initialValue: initValue['phone'],
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      user_add = User(id: user_add.id,
                          first_name: user_add.first_name,
                          last_name: value,
                          email: user_add.email,
                          password: user_add.password);
                      // _authData['password'] = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    obscureText: true,
                    initialValue: initValue['Email'],
                    // controller: _passwordController,
                    onSaved: (value) {
                      user_add = User(id: user_add.id,
                          first_name: user_add.first_name,
                          last_name: user_add.last_name,
                          email: value,
                          password: user_add.password);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    obscureText: true,
                    initialValue: initValue['password'],

                    // controller: _passwordController,
                    onSaved: (value) {
                      user_add = User(id: user_add.id,
                          first_name: user_add.first_name,
                          last_name: user_add.last_name,
                          email: user_add.email,
                          password: value);
                    },
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed: _save, child: Text("ADD"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
