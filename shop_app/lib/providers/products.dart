import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../model/http_exception.dart';
import './product.dart';
class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  // var _showFavoritesOnly = false;
  final String authToken;
  final String UserId;
  Products(this.authToken,this.UserId,this._items);



  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
  Future<void>fetchandsetproducts([bool filterByUer=false])async{
    final filterString=filterByUer?'orderBy="creatorId"&equalTo="$UserId"':'';
    var url= Uri.parse('https://flutter-shop-11bc3-default-rtdb.firebaseio.com/Products.json?auth=$authToken$filterString');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData==null){
        return;
      }
       url = Uri.parse(
          'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/UserFavorite/$UserId.json?auth=$authToken');
      final favresponse=await http.get(url);
      final Favoritedata=json.decode(favresponse.body);
       List<Product> loadedProducts = [];
      print(extractedData);
      if (extractedData.isEmpty) {
        return;
      }
      extractedData.forEach(
            (pId, pData) {

          loadedProducts.add(Product(
              id:pId,
              title: pData['title'],
              description: pData['description'],
              price: pData['price'],
              isFavorite:Favoritedata==null? false :Favoritedata[UserId]??false,
              imageUrl: pData['imageUrl'],
          ));
        },
      );
      print('loadedProducts$loadedProducts');
      _items = loadedProducts;
      notifyListeners();

    }catch(error){
      print(error);
      throw error;
    }

  }
  Future<void> addProduct(Product product_) async{
   final url= Uri.parse('https://flutter-shop-11bc3-default-rtdb.firebaseio.com/Products.json?auth=$authToken');
   try {
     final value = await http.post(
       url,
       body: json.encode({
         'title': product_.title,
         'description': product_.description,
         'imageUrl': product_.imageUrl,
         'price': product_.price,
         'isFavorite': product_.isFavorite,
         'creatorId':UserId
       }),
     );

     final newProduct = Product(
         id: json.decode(value.body)['name'],
         title: product_.title,
         description: product_.description,
         price: product_.price,
         imageUrl: product_.imageUrl,
         isFavorite: product_.isFavorite);
     _items.add(newProduct);
     notifyListeners();
   } catch (error) {
     print(error);
     rethrow ;
   }
  }
 Future <void> updateproduct(String id,Product newproduct) async{
final proindex=_items.indexWhere((prod) => prod.id==id);
print(proindex);
if(proindex>=0){
  final url= Uri.parse('https://flutter-shop-11bc3-default-rtdb.firebaseio.com/Products/$id.json?auth=$authToken');
  await http.patch(url,body: json.encode({
  'title':newproduct.title,
   'description':newproduct.description,
   'imageUrl':newproduct.imageUrl,
   'price':newproduct.price,
    // 'isFavorite':newproduct.isFavorite
 }));
  _items[proindex]=newproduct;
  notifyListeners();
}else{
 //p print(proindex);
  print("ygbgs....");
}
  }

 Future <void> deletproduct(String id)async{
   final url = Uri.parse(
       'https://shop-app-4b081-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');

   final existingProductIndex =
   _items.indexWhere((element) => element.id == id);
   Product? existingProduct = _items[existingProductIndex];
   print(existingProduct);
   _items.removeAt(existingProductIndex);
   notifyListeners();
   final response = await http.delete(url);

   if (response.statusCode >= 400) {
     _items.insert(existingProductIndex, existingProduct as Product);
     notifyListeners();
     throw HttpException('Could not delete product.');
   }
   existingProduct = null;
   print(response.statusCode);

   /** Normal removing products
       http.delete(url);
       _items.removeWhere((element) => element.id == id);
       notifyListeners()
    */
 }
}

