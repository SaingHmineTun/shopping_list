import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping_list/model/Item.dart';
import 'package:shopping_list/screens/item_screen.dart';

List<Item> sampleItems = [
  Item("မၢၵ်ႇပၢၼ်းတီး", 1500, 10, Category.food),
  Item("မၢၵ်ႇၸွၵ်", 500, 50, Category.accessories),
  Item("မၢၵ်ႇသပိတ်ႉ", 5000, 5, Category.books),
  Item("မၢၵ်ႇႁႃလၢတ်ႊ", 3000, 5, Category.others),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ၶူဝ်းၵုၼ်ႇ"),
        actions: [
          IconButton(
            onPressed: () async {
              final returnedValue = await Navigator.of(
                context,
              ).push<Item>(MaterialPageRoute(builder: (ctx) => ItemScreen()));
              if (returnedValue != null) {
                setState(() {
                  sampleItems.add(returnedValue);
                });
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 600, mainAxisExtent: 100),
        itemCount: sampleItems.length,
        itemBuilder: (ctx, index) {
          final item = sampleItems[index];
          return Dismissible(
            key: ValueKey(item),
            onDismissed: (direction) {
              setState(() {
                sampleItems.remove(item);
              });
            },
            child: Card(
              color: item.category.color.withAlpha(50),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item.category.color,
                    child: Text(index.toString()),
                  ),
                  trailing: Text("${item.price} ၵျၢပ်ႈ"),
                  title: Text(item.name),
                  subtitle: Text("ၵိုတ်းဝႆႉထႅင်ႈ ${item.quantity} လုၵ်ႈ"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
