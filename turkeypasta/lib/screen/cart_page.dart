import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkeypasta/config/state_management.dart';
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Checkout"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Consumer<CartProvider>(builder: (context, value, child) {
            return value.cartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [Text(value.cartItems[index].title!)],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No Item",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  );
          })),
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
      )),
    );
  }
}
