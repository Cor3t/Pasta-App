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
        title: const Text("Cart"),
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
                      return ItemView(
                        value: value.cartItems,
                        index: index,
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
                      "CHECKOUT",
                      style: buttonTextStyle2,
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}

class ItemView extends StatelessWidget {
  final List? value;
  final int? index;
  const ItemView({
    required this.value,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage("assets/images/pasta.png"),
            width: 100,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: SizedBox(
                  width: pcent(MediaQuery.of(context).size.width, 45),
                  child: Text(
                    value![index!].title!,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  AmountButton(icon: Icons.remove),
                  SizedBox(width: 10),
                  Text("1"),
                  SizedBox(width: 10),
                  AmountButton(icon: Icons.add)
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
            "$priceSign${value![index!].price!}",
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}

class AmountButton extends StatelessWidget {
  final IconData? icon;
  // final Function? function;
  const AmountButton({
    this.icon,
    // this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFF2EEED),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        onPressed: () {},
        child: Icon(
          icon,
          size: 19,
          color: Colors.black,
        ),
      ),
    );
  }
}
