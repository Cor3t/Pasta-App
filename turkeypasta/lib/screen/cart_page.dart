import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turkeypasta/config/template.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text("Total:"), Text("20")],
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(
                              _screenSize.width, pcent(_screenSize.height, 7)),
                          backgroundColor: burntOrange,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      onPressed: () {},
                      child: Text(
                        "Checkout",
                        style: buttonTextStyle1,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
