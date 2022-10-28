import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';


class Edit_Screen extends StatefulWidget {
  static const routeName = '/ edit_screen';

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  final _pricefocus = FocusNode();
  final _Descriptionfocus = FocusNode();
  final _imageUrl = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imgUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _editedproduct = Product(
      id:  'one',
      title: '',
      description: '',
      price: 0,
      imageUrl: '');

  @override
  void initState() {
    _imageUrlFocus.addListener(updateimageurl);
    super.initState();
  }

  void updateimageurl() {
    if (_imageUrlFocus.hasFocus) {
      setState(() {});
    }
  }

  void Saveform() {

    final isvalid=_form.currentState!.validate();
    if(isvalid!){
      print(isvalid);
      return;
    }
    _form.currentState!.save();

    print(_editedproduct.title);
    print(_editedproduct.description);
    print(_editedproduct.price);
    print(_editedproduct.imageUrl);
  }

  @override
  void dispose() {
    _imageUrlFocus.removeListener(updateimageurl);
    _pricefocus.dispose();
    _Descriptionfocus.dispose();
    _imageUrl.dispose();
    _imageUrlFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [
          IconButton(onPressed: Saveform, icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_pricefocus);
                },
                validator: (val){
                  if(val!.isEmpty){
                    return "please provide a value";
                  }
                  return null;
                },
                onSaved: (val){
                  _editedproduct=Product(id: _editedproduct.id, title: val as String, description: _editedproduct.description, price: _editedproduct.price, imageUrl: _editedproduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _pricefocus,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_Descriptionfocus);
                },
                validator: (val){
                  if(val!.isEmpty){
                    return "please provide a value";
                  }
                  return null;
                },
                onSaved: (val){
                  _editedproduct=Product(id: _editedproduct.id, title: _editedproduct.title, description: _editedproduct.description, price: double.parse(val!), imageUrl: _editedproduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                focusNode: _Descriptionfocus,
                onSaved: (val){
                  _editedproduct=Product(id: _editedproduct.id, title: _editedproduct.title, description: val as String, price: _editedproduct.price, imageUrl: _editedproduct.imageUrl);
                },

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)
                      ),
                      child: _imgUrlController.text.isEmpty ? Text(
                          'Enter a Url') : FittedBox(
                        child: Image.network(
                          _imgUrlController.text, fit: BoxFit.cover,),
                      )
                  ),
                  Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imgUrlController,
                        focusNode: _imageUrlFocus,
                        // onEditingComplete: () {
                        //   setState(() {
                        //     Saveform();
                        //   });
                        // },
                        onFieldSubmitted: (_) {
                          Saveform();
                        },
                        onSaved: (val){
                          _editedproduct=Product(id: _editedproduct.id, title:_editedproduct.title, description: _editedproduct.description, price: _editedproduct.price, imageUrl: val as String);
                        },
                      )
                  ),
                ],
              )
            ],
          ),),
      ),
    );
  }
}
