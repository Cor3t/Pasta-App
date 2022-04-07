import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/config/tools.dart';

import '../state_management/selection_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("My Cart"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Consumer<CartProvider>(builder: (context, value, child) {
            return ListView(
                children: value.cartItems
                    .map((e) => ItemView(title: e.title!, price: e.price!))
                    .toList());
          })),
          CheckoutSection(screenSize: _screenSize),
        ],
      )),
    );
  }
}

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({
    Key? key,
    required Size screenSize,
  })  : _screenSize = screenSize,
        super(key: key);

  final Size _screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                fixedSize:
                    Size(_screenSize.width, pcent(_screenSize.height, 7)),
                backgroundColor: burntOrange,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {},
              child: Text(
                "CHECKOUT",
                style: buttonTextStyle2,
              ),
            )
          ],
        ));
  }
}

class ItemView extends StatelessWidget {
  final String title;
  final int price;
  const ItemView({
    required this.title,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage("assets/images/pasta.png"),
            width: 100,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  width: pcent(MediaQuery.of(context).size.width, 60),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "1 item  ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    "$priceSign$price",
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
