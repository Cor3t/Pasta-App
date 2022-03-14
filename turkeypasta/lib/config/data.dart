class MenuData {
  final String? title;
  final int? price;

  MenuData({this.title, this.price});
}

class Extras {
  final String? title;
  final int? price;

  Extras({this.title, this.price});
}

List<MenuData> menu = [
  MenuData(title: "Jombo Combo", price: 3000),
  MenuData(title: "Pasta & Roasted Chicken", price: 2700),
  MenuData(title: "Pasta & Pepper Chicken", price: 2000),
  MenuData(title: "Pasta & Double Pepper Chicken", price: 2500),
  MenuData(title: "Pasta & Meatball", price: 2500),
  MenuData(title: "Meatball Combo", price: 2500),
  MenuData(title: "Macaroni & Pepper Chicken", price: 2000),
  MenuData(title: "Macaroni & Double Pepper Chicken", price: 2500),
  MenuData(title: "Special Jombo", price: 3500),
];

List<Extras> extras = [
  Extras(title: "Chicken & Chips", price: 2000),
  Extras(title: "Dodo & Pepper Chicken", price: 1500),
  Extras(title: "Extra Meatball (1 piece)", price: 500),
  Extras(title: "Extra Pepper Chicken", price: 500),
  Extras(title: "Extra Crunchy Chicken", price: 800),
  Extras(title: "Extra Roasted Chicken", price: 1500),
  Extras(title: "Extra Turkey", price: 1500),
  Extras(title: "6 pieces of Chicken Drumsticks", price: 3000),
];
