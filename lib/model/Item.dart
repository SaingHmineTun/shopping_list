import 'package:flutter/material.dart';

enum Category {
  // သႂ်ႇသီမၢၵ်ႇၸွၵ်ႇ တူၺ်းလႄႈလႅပ်ႈၵိၼ်ဝၢၼ်
  food(Colors.orange),
  // ပဵၼ်ၼမ်ႉလႄႈ သႂ်ႇသ
  drink(Colors.blue),
  clothes(Colors.red),
  accessories(Colors.grey),
  electronics(Colors.yellow),
  books(Colors.green),
  others(Colors.purple);

  final Color color;
  const Category(this.color);
}

class Item {
  String name;
  double price;
  int quantity;
  Category category;
  Item(this.name, this.price, this.quantity, this.category);

  @override
  String toString() {
    return 'Item{name: $name, price: $price, quantity: $quantity, category: $category}';
  }
}