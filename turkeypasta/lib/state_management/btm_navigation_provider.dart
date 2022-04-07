import 'package:flutter/cupertino.dart';

class BottomNavigationProvider with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
