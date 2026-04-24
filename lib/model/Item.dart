import 'package:flutter/material.dart';

enum Category {
  // သႂ်ႇသီမၢၵ်ႇၸွၵ်ႇ တူၺ်းလႄႈလႅပ်ႈၵိၼ်ဝၢၼ်
  food(Colors.orange),
  // ပဵၼ်ၼမ်ႉလႄႈ သႂ်ႇသ
  drink(Colors.blue),
  // သီလႅင် တၢင်တူဝ် သိူဝ်ႈၶူဝ်းၼုင်ႈ
  clothes(Colors.red),
  // သီၵွၼ်းၾႆး တၢင်တူဝ် ၶိူင်ႈၸႂ်ႉတိုဝ်း
  accessories(Colors.grey),
  // သီလိူင် တၢင်တူဝ် ၶိူင်ႈၾႆးၾႃႉ
  electronics(Colors.yellow),
  // သီၶဵဝ် တၢင်တူဝ် ပပ်ႉလိၵ်ႈ
  books(Colors.green),
  // သီၵမ်ႇ တၢင်တူဝ် တၢင်ႇလွင်ႈ
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