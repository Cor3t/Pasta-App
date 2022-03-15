import 'package:flutter/cupertino.dart';
import 'package:turkeypasta/config/data.dart';

class Counter with ChangeNotifier {
  int _count = 1;
  int total = 0;
  List<Extras> extras = [];

  int get count => _count;

  int totalPrice(int price) => (total + price) * count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void addExtra(Extras extra) {
    if (!extras.any((e) => e.title == extra.title)) {
      extras.add(extra);
      total += extra.price!;
    } else {
      extras.remove(extra);
      total -= extra.price!;
    }

    notifyListeners();
  }
}

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

class AddToCart with ChangeNotifier {
  List<CartData> cartItems = [];

  void addToCart(CartData cartData) {
    cartItems.add(cartData);

    notifyListeners();
  }
}
