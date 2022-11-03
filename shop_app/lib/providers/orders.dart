import 'package:flutter/foundation.dart';
import 'dart:convert';
import './cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String? id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String UseId;

  Orders(this.authToken,this.UseId,this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchsetOrder() async {
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/Orders/$UseId.json?auth=$authToken');
    final response = await http.get(url);
    final List<OrderItem> loadedOrder = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((OrderId, OrderData) {
      if(extractedData==null){
        return;
      }
      loadedOrder.add(OrderItem(
        id: OrderId,
        amount: OrderData['amount'],
        products: (OrderData['products'] as List<dynamic>).map((item) =>
            CartItem(
                id: item['id'],
                title: item['title'],
                quantity: item['quantity'],
                price: item['price'])).toList(),
        dateTime: OrderData['Datetime']??DateTime.now(),
      ));
    });
    _orders =loadedOrder;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-shop-11bc3-default-rtdb.firebaseio.com/Orders/$UseId.json?auth=$authToken');
    final timestamp = DateTime.now();
    final respone = await http.post(url,
        body: json.encode({
          'amount': total,
          'datetime': timestamp.toString(),
          'products': cartProducts
              .map((e) => {
                    'id': e.id,
                    'price': e.price,
                    'title': e.title,
                    'quantity': e.quantity
                  })
              .toList(),
        }));
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(respone.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
