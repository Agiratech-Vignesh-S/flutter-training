import 'package:flutter/material.dart';

class Cartitem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  Cartitem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price});
}

class Cart with ChangeNotifier {
   Map<String, Cartitem>_items={};

  Map<String, Cartitem> get item {
    return {...item};
  }

  double get totalamount{
   var total=0.0;
   _items.forEach((key, Cartitem) {
     total += Cartitem.price * Cartitem.quantity;
   });
   return total;
  }

  int get itemcount{
    return _items == null ? 0 : _items!.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (v) => Cartitem(id: v.id, title: v.title, quantity: v.quantity+1, price: v.price));
    }
    else {
      _items.putIfAbsent(productId, () =>
          Cartitem(id: DateTime.now().toString(),
              title: title,
              price: price as double ,
              quantity: 1));
    }
    notifyListeners();
  }
}