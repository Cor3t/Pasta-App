import 'package:flutter/cupertino.dart';
import 'package:turkeypasta/models/data.dart';

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
