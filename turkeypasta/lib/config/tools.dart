import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget? child;

  SlideLeftRoute({this.child})
      : super(pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}

double pcent(double size, double p) {
  double result = (size / 100) * p;
  return result;
}

int total(List<int?> values) {
  int a = 0;
  for (int? i in values) {
    a += i!;
  }
  return a;
}


// appBar: AppBar(
//         elevation: 0,
//         leading: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Icon(Icons.menu),
//         ),
//         actions: [
//           Consumer<CartProvider>(builder: (context, cart, child) {
//             return Badge(
//               position: BadgePosition.topEnd(top: 2, end: 18),
//               badgeContent: Center(
//                 child: Text(
//                   cart.cartItems.length.toString(),
//                   style: cartBadgeTextStyle,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: IconButton(
//                   icon: const Icon(Icons.shopping_cart),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const CartPage()));
//                   },
//                 ),
//               ),
//               showBadge: cart.cartItems.isNotEmpty,
//             );
//           }),
//         ],
//       ),
