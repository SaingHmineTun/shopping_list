import 'package:flutter/material.dart';

enum Category {
  food(Colors.orange),
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