import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkeypasta/config/data.dart';
import 'package:turkeypasta/config/state_management.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/config/tools.dart';
import 'package:turkeypasta/screen/cart_page.dart';
import 'package:turkeypasta/screen/view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String message = "What would you \nlike to eat?";
  var space = const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: [
          Consumer<CartProvider>(builder: (context, cart, child) {
            return Badge(
              position: BadgePosition.topEnd(top: 0, end: -10),
              badgeContent: Center(
                  child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  cart.cartItems.length.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
              child: const Icon(Icons.shopping_cart),
              showBadge: cart.cartItems.isNotEmpty,
            );
          }),
          const SizedBox(width: 18),
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(),
              Column(
                  children: menu
                      .map((e) => FoodItems(title: e.title, price: e.price))
                      .toList())
            ],
          ))
        ],
      )),
    );
  }
}

class FoodItems extends StatelessWidget {
  final String? title;
  final String priceSign = "\u20A6";
  final int? price;

  const FoodItems({
    this.title,
    this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SlideLeftRoute(
              child: ViewPage(
            key: key,
            title: title,
            price: price,
          )),
        );
      },
      child: Container(
        height: pcent(MediaQuery.of(context).size.height, 15),
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(4, 4),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10)
            ],
            color: const Color(0xFFFFFFFF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
                image: AssetImage("assets/images/pasta.png"),
                width: 120,
                fit: BoxFit.contain),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    width: pcent(MediaQuery.of(context).size.width, 40),
                    child: Text(
                      title!,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                    text: TextSpan(
                        text: priceSign,
                        style: Theme.of(context).textTheme.caption,
                        children: [
                      TextSpan(
                          text: price.toString(),
                          style: Theme.of(context).textTheme.headline3)
                    ]))
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: pcent(MediaQuery.of(context).size.width, 13),
                  decoration: const BoxDecoration(
                    color: burntOrange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
