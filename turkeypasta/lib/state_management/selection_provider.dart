import 'package:flutter/cupertino.dart';
import 'package:turkeypasta/models/data.dart';

class Selection with ChangeNotifier {
  bool _value = false;

  bool get value => _value;
  int total = 0;

  void isMarked(Extras extra) {
    _value = !_value;

    total += extra.price!;

    notifyListeners();
  }
}

class CartProvider with ChangeNotifier {
  List<CartData> cartItems = [];

  void addToCart(CartData cartData) {
    cartItems.add(cartData);

    notifyListeners();
  }
}
