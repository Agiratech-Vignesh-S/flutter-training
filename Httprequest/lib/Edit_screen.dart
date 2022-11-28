import 'package:flutter/material.dart';
import 'package:httprequest/Provider/User_pro.dart';
import 'package:httprequest/model/Add_User.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class Edit_screen extends StatefulWidget {
  static const routeName='/edit_screen';

  final String id;
  final bool add;

  Edit_screen({required this.id,required this.add});

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}

class _Edit_screenState extends State<Edit_screen> {

  User _editedUser = User(id: '',first_name: '',last_name: '', email: '', password: '',);

  Map initValue = {'first_name': '','lastname': '', 'Email': '', 'password': '',};
  bool isLoading = false;


  Future<void> _save(bool isadd) async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      isLoading = true;
    });
    if (isadd) {
      await Provider.of<User_provider>(context, listen: false)
          .add_user(_editedUser);
    } else {
      await Provider.of<User_provider>(context, listen: false)
          .updateUser(_editedUser.id!, _editedUser);
    }
    setState((() {
      isLoading = false;
    }));
    Navigator.pop(context);
  }


  bool _isInit=true;
  var uservalues;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      uservalues =
      ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      if (uservalues['id'] != '') {
        _editedUser = Provider.of<User_provider>(context, listen: false)
            .findById(uservalues['id']);
        initValue = {
          'first_name': _editedUser.first_name,
          'last_name':_editedUser.last_name,
          'email': _editedUser.email,
          'password': _editedUser.password,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  final _form = GlobalKey<FormState>();


  TextEditingController? textEditingController=TextEditingController();
  bool isEmailcorrect=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isEmailcorrect==false?Colors.red:Colors.green,
        title: uservalues['isAdd'] ?Text("Add User"):Text('edit user'),
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
                    initialValue: initValue['first_name'],
                    onSaved: (value) {
                      _editedUser = User(id: _editedUser.id,
                          first_name: value,
                          last_name: _editedUser.last_name,
                          email: _editedUser.email,
                          password: _editedUser.password);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'last_name'),
                    initialValue: initValue['last_name'],
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      _editedUser = User(id: _editedUser.id,
                          first_name: _editedUser.first_name,
                          last_name: value,
                          email: _editedUser.email,
                          password: _editedUser.password);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    initialValue: initValue['email'],
                    validator: (value) {
                      if(!(isEmail(value.toString()))){
                        return "please check a value";
                      }
                      setState(() {
                        isEmailcorrect=isEmail(value.toString());
                      });


                    } ,
                    onSaved: (value) {
                      _editedUser = User(id: _editedUser.id,
                          first_name: _editedUser.first_name,
                          last_name: _editedUser.last_name,
                          email: value,
                          password: _editedUser.password);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    obscureText: true,
                    initialValue: initValue['password'],

                    onSaved: (value) {
                      _editedUser = User(id: _editedUser.id,
                          first_name: _editedUser.first_name,
                          last_name: _editedUser.last_name,
                          email: _editedUser.email,
                          password: value);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed:(){
                    _save(uservalues['isAdd']);
                  },
                      child: Text(uservalues['isAdd']
                          ? 'Save'
                          : 'Update'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
