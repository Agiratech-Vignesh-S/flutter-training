import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

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
  bool _isInit=true;

  var _editedproduct =
      Product(id: 'one', title: '', description: '', price: 0, imageUrl: '');

  var initvalue={
    'title':'',
    'description':'',
    'price':'',
    'imageUrl':'',
  };

  @override
  void initState() {
    _imageUrlFocus.addListener(updateimageurl);
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(_isInit){
      final productId=ModalRoute.of(context)!.settings.arguments as Map<dynamic, Object>;
      if (productId['isAdd'] == false) {
        if (productId.isNotEmpty) {
          _editedproduct = Provider.of<Products>(context).findById(
              productId['id'] as String);
          print('productId$productId');
          initvalue = {
            'title': _editedproduct.title,
            'Description': _editedproduct.description,
            'price': _editedproduct.price.toString(),
            // 'imageUrl':_editedproduct.imageUrl
            'imageUrl': '',
          };
          _imgUrlController.text = _editedproduct.imageUrl;
        }
      }
    }
    _isInit=false;
    super.didChangeDependencies();
  }

  void updateimageurl() {
    setState(() {});
    if (_imageUrlFocus.hasFocus) {
      if ((!_imgUrlController.text.startsWith('http') &&
              !_imgUrlController.text.startsWith('https')) ||
          (!_imgUrlController.text.endsWith('.png') &&
              !_imgUrlController.text.endsWith('.jpg') &&
              !_imgUrlController.text.endsWith('.jpeg'))) {
        return;
      }

    }
  }
  var productId;
  void Saveform() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return; // it terminates the this function , print statemwnts wont work
    }
    _form.currentState!.save();

    if(_editedproduct.id.isNotEmpty){
      Provider.of<Products>(context, listen: false).updateproduct(_editedproduct.id,_editedproduct);
    }else{
      Provider.of<Products>(context, listen: false).addProduct(_editedproduct);
    }

    Navigator.pop(context);
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
        actions: [IconButton(onPressed: Saveform, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: initvalue['title'],
                decoration: InputDecoration(
                  labelText: 'title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_pricefocus);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please provide a value";
                  }
                  return null;
                },
                onSaved: (val) {
                  _editedproduct = Product(
                      id: _editedproduct.id,
                      title: val as String,
                      description: _editedproduct.description,
                      price: _editedproduct.price,
                      imageUrl: _editedproduct.imageUrl,
                  isFavorite: _editedproduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                initialValue: initvalue['price'],
                decoration: InputDecoration(
                  labelText: 'price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _pricefocus,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_Descriptionfocus);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please provide a value";
                  }
                  if (double.tryParse(val) == null) {
                    return "please enter valid number.";
                  }
                  if (double.parse(val) <= 0) {
                    return "please enter a number greater than zero";
                  }
                  return null;
                },
                onSaved: (val) {
                  _editedproduct = Product(
                      id: _editedproduct.id,
                      title: _editedproduct.title,
                      description: _editedproduct.description,
                      price: double.parse(val!),
                      imageUrl: _editedproduct.imageUrl,
                      isFavorite: _editedproduct.isFavorite
                  );
                },
              ),
              TextFormField(
                initialValue: initvalue['Description'],
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                focusNode: _Descriptionfocus,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter a Description";
                  }
                  return null;
                },
                onSaved: (val) {
                  _editedproduct = Product(
                      id: _editedproduct.id,
                      title: _editedproduct.title,
                      description: val as String,
                      price: _editedproduct.price,
                      imageUrl: _editedproduct.imageUrl,
                      isFavorite: _editedproduct.isFavorite
                  );
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
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: _imgUrlController.text.isEmpty
                          ? Text('Enter a Url')
                          : FittedBox(
                              child: Image.network(
                                _imgUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            )),
                  Expanded(
                      child: TextFormField(
                        // initialValue: initvalue['imageUrl'],
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
                    onSaved: (val) {
                      _editedproduct = Product(
                          id: _editedproduct.id,
                          title: _editedproduct.title,
                          description: _editedproduct.description,
                          price: _editedproduct.price,
                          imageUrl: val.toString(),
                          isFavorite: _editedproduct.isFavorite
                      );
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "please enter a Image Url";
                      }
                      // if (!val.startsWith('http') && !val.startsWith('https')) {
                      //   return "please enter a valid Url";
                      // }
                      return null;
                    },
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
