import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkeypasta/screen/cart_page.dart';
import 'package:turkeypasta/screen/profile_page.dart';
import 'package:turkeypasta/state_management/btm_navigation_provider.dart';
import 'package:turkeypasta/state_management/selection_provider.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        ChangeNotifierProvider<BottomNavigationProvider>(
            create: (context) => BottomNavigationProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Turkey Pasta',
          theme: appTheme,
          home: const AppBody()),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({
    Key? key,
  }) : super(key: key);

  static const List<Widget> _screens = [HomePage(), CartPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(builder: (context, value, child) {
      return Scaffold(
        body: SafeArea(child: _screens.elementAt(value.selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: burntOrange,
          backgroundColor: Colors.white,
          elevation: 5,
          currentIndex: value.selectedIndex,
          onTap: value.onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: CartIcon(), label: "Carts"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Badge(
        borderSide: const BorderSide(width: 0.9, color: Colors.white),
        elevation: 0,
        badgeContent: Center(
          child: Text(
            cart.cartItems.length.toString(),
            style: cartBadgeTextStyle,
          ),
        ),
        child: const Icon(Icons.shopping_cart),
        showBadge: cart.cartItems.isNotEmpty,
      );
    });
  }
}
