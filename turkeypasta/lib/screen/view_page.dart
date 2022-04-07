import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkeypasta/models/data.dart';
import 'package:turkeypasta/config/snack_message.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/config/tools.dart';

import '../state_management/counter_provider.dart';
import '../state_management/selection_provider.dart';

class ViewPage extends StatefulWidget {
  final String? title;
  final int? price;

  const ViewPage({this.title, this.price, Key? key}) : super(key: key);

  @override
  ViewPageState createState() => ViewPageState();
}

class ViewPageState extends State<ViewPage> {
  var spacing = const SizedBox(height: 20);
  var padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<Counter>(
            create: (context) => Counter(),
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leadingWidth: 50,
                          backgroundColor: Colors.white,
                          iconTheme: const IconThemeData(color: Colors.black),
                          floating: true,
                          leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ),
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return Column(
                            children: [
                              const Image(
                                image: AssetImage("assets/images/pasta.png"),
                                height: 270,
                              ),
                              spacing,
                              Padding(
                                padding: padding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(widget.title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: priceSign,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                                children: [
                                              TextSpan(
                                                  text: widget.price.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2)
                                            ]))
                                      ],
                                    ),
                                    spacing,
                                    Text(
                                        "Spagetti, Tomatoes, Green Pepper, Sausage, Cabbage, Carrot, Peas, Sliced Chicken and Onion",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1)
                                  ],
                                ),
                              ),
                              spacing,
                              Divider(
                                color: Colors.grey[200],
                                thickness: 8,
                              ),
                              spacing,
                              Column(children: [
                                Padding(
                                  padding: padding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "WOULD YOU LIKE SOME EXTRAS?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      Text(
                                        "Optional",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                spacing,
                                Column(
                                  children: extras
                                      .map((e) => ExtrasListTile(extras: e))
                                      .toList(),
                                ),
                              ])
                            ],
                          );
                        }, childCount: 1))
                      ],
                    ),
                  ),
                  Consumer<Counter>(builder: (context, count, child) {
                    return AddToCart(
                      title: widget.title!,
                      fPrice: widget.price!,
                      count: count.count.toString(),
                    );
                  })
                ],
              );
            }),
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.title,
    required this.fPrice,
    required this.count,
  }) : super(key: key);

  final int fPrice;
  final String count, title;

  @override
  Widget build(BuildContext context) {
    var _control = Provider.of<Counter>(context, listen: false);
    var _addToCart = Provider.of<CartProvider>(context, listen: false);

    return Container(
      height: pcent(MediaQuery.of(context).size.height, 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _amountButton(
              function: () {
                _control.count > 1 ? _control.decrement() : null;
              },
              icon: Icons.remove,
              color: _control.count > 1 ? burntOrange : Colors.grey),
          const Spacer(flex: 2),
          Text(count, style: const TextStyle(fontSize: 20)),
          const Spacer(flex: 2),
          _amountButton(
              function: () {
                _control.increment();
              },
              icon: Icons.add,
              color: burntOrange),
          const Spacer(),
          TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: pcent(MediaQuery.of(context).size.width, 12),
                      vertical: 10),
                  backgroundColor: burntOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                CartData cartData =
                    CartData(title: title, price: fPrice, amount: 2);
                _addToCart.addToCart(cartData);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBar(addedToCartSnackbar));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Counter>(builder: (context, price, child) {
                    return Text(
                      "$priceSign${price.totalPrice(fPrice)}",
                      style: buttonTextStyle1,
                    );
                  }),
                  Text(
                    "Add to Cart",
                    style: buttonTextStyle2,
                  )
                ],
              ))
        ],
      ),
    );
  }

  TextButton _amountButton({Function? function, IconData? icon, Color? color}) {
    return TextButton(
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 13.5, vertical: 13.5),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: color!, width: 1.5),
                borderRadius: BorderRadius.circular(8))),
        onPressed: () {
          function!();
        },
        child: Icon(
          icon,
          color: color,
        ));
  }
}

class ExtrasListTile extends StatelessWidget {
  final Extras extras;

  const ExtrasListTile({
    required this.extras,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _totalExtras = Provider.of<Counter>(context, listen: false);
    return ChangeNotifierProvider<Selection>(
        create: (context) => Selection(),
        builder: (context, child) {
          return Consumer<Selection>(builder: (context, check, child) {
            return GestureDetector(
              onTap: () {
                check.isMarked(extras);
                _totalExtras.addExtra(extras);
              },
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(color: Color(0xFFBDBDBD), blurRadius: 10.0)
                    ]),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: burntOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      side: const BorderSide(width: 1.2, color: burntOrange),
                      value: check.value,
                      onChanged: (isTrue) {
                        check.isMarked(extras);
                        _totalExtras.addExtra(extras);
                      },
                    ),
                    Text(
                      extras.title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    RichText(
                        text: TextSpan(
                            text: priceSign,
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(text: extras.price.toString())
                        ]))
                  ],
                ),
              ),
            );
          });
        });
  }
}
