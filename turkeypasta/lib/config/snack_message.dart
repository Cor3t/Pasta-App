import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/config/tools.dart';
import '../state_management/selection_provider.dart';

SnackBar snackBar(Widget widget) {
  return SnackBar(
    content: widget,
    elevation: 0,
    backgroundColor: const Color(0x00FFFFFF),
  );
}

var addedToCartSnackbar =
    Consumer<CartProvider>(builder: (context, value, child) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${value.cartItems.length} items"),
          const Text(
            "View Order",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          Text(
              " $priceSign${total(value.cartItems.map((e) => e.price).toList())}")
        ],
      ));
});
