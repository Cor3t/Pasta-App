import 'package:flutter/material.dart';
import 'package:turkeypasta/models/data.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/config/tools.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                message,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(),
            Column(
                children: menu
                    .map((e) => FoodItems(
                          title: e.title,
                          price: e.price,
                        ))
                    .toList())
          ],
        ))
      ],
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
        height: pcent(MediaQuery.of(context).size.height, 13),
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          children: [
            const Image(
                image: AssetImage("assets/images/pasta.png"),
                width: 100,
                fit: BoxFit.contain),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    width: pcent(MediaQuery.of(context).size.width, 55),
                    child: Text(
                      title!,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$priceSign$price",
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
