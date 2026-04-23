import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_list/model/Item.dart';
import 'package:shopping_list/screens/item_screen.dart';

// List<Item> sampleItems = [
//   Item("မၢၵ်ႇပၢၼ်းတီး", 1500, 10, Category.food),
//   Item("မၢၵ်ႇၸွၵ်", 500, 50, Category.accessories),
//   Item("မၢၵ်ႇသပိတ်ႉ", 5000, 5, Category.books),
//   Item("မၢၵ်ႇႁႃလၢတ်ႊ", 3000, 5, Category.others),
// ];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box? _shoppingList;

  @override
  void initState() {
    super.initState();
    _shoppingList = Hive.box("shopping_list");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ၶူဝ်းၶွင်ဢၼ်သိုဝ်ႉဝႆႉ"),
        actions: [
          IconButton(
            onPressed: () async {
              final returnedValue = await Navigator.of(
                context,
              ).push<Item>(MaterialPageRoute(builder: (ctx) => ItemScreen()));
              if (returnedValue != null) {
                setState(() {
                  // sampleItems.add(returnedValue); // add
                  _shoppingList?.add({
                    "name": returnedValue.name,
                    "price": returnedValue.price,
                    "quantity": returnedValue.quantity,
                    "category": returnedValue.category.name,
                  });
                });
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: _shoppingList == null
          ? Center(child: Text("SORRY"))
          : ValueListenableBuilder(
              valueListenable: _shoppingList!.listenable(),
              builder: (ctx, boxes, child) => GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 600,
                  mainAxisExtent: 100,
                ),
                itemCount: boxes.keys.length, // read
                itemBuilder: (ctx, index) {
                  final item = boxes.values.toList()[index]; // read
                  return Dismissible(
                    key: ValueKey(item),
                    onDismissed: (direction) {
                      setState(() {
                        boxes.delete(boxes.keys.toList()[index]); // delete
                      });
                    },
                    child: Card(
                      color: item.category.color.withAlpha(50),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: item.category.color,
                            child: Text(index.toString()),
                          ),
                          trailing: Text("${item.price} ၵျၢပ်ႈ"),
                          title: Text(item.name),
                          subtitle: Text(
                            "ၵိုတ်းဝႆႉထႅင်ႈ ${item.quantity} လုၵ်ႈ",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
