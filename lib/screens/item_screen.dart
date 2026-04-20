import 'package:flutter/material.dart';
import 'package:shopping_list/model/Item.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _name = "";
  var _price = 0.0;
  var _quantity = 0;
  var _category = Category.food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add / Edit Item'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: SingleChildScrollView( // Added scroll for smaller screens
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).dividerColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Item Details",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),

                            // Item Name Field
                            TextFormField(
                              onSaved: (str) {
                                _name = str!;
                              },
                              validator: (str) => (str == null || str.trim().isEmpty) ? 'Please enter item name' : null,
                              decoration: const InputDecoration(
                                labelText: 'Item Name',
                                prefixIcon: Icon(Icons.shopping_bag_outlined), // prefix, suffix
                                border: OutlineInputBorder(),
                                hintText: 'e.g. Milk',
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Price and Quantity Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onSaved: (str) {
                                      _price = double.parse(str!);
                                    },
                                    keyboardType: TextInputType.number,
                                    validator: (str) {
                                      if (str == null || str.trim().isEmpty || double.tryParse(str) == null) {
                                        return 'Invalid price';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Price',
                                      prefixIcon: Icon(Icons.attach_money),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    onSaved: (str) {
                                      _quantity = int.parse(str!);
                                    },
                                    keyboardType: TextInputType.number,
                                    validator: (str) {
                                      if (str == null || str.trim().isEmpty || int.tryParse(str) == null) {
                                        return 'Invalid qty';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Quantity',
                                      prefixIcon: Icon(Icons.numbers),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Category Dropdown
                            DropdownButtonFormField<Category>(
                              onSaved: (category) {
                                _category = category!;
                              },
                              value: Category.food,
                              decoration: const InputDecoration(
                                labelText: 'Category',
                                prefixIcon: Icon(Icons.category_outlined),
                                border: OutlineInputBorder(),
                              ),
                              items: Category.values.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase()),
                                );
                              }).toList(),
                              onChanged: (item) {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _formKey.currentState?.reset(),
                            icon: const Icon(Icons.refresh),
                            label: const Text("Reset"),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save(); // call onSaved methods
                                print(_name);
                                print(_price);
                                print(_quantity);
                                print(_category.name);

                                final item = Item(_name, _price, _quantity, _category);

                                Navigator.of(context).pop(item);
                              }
                            },
                            icon: const Icon(Icons.save),
                            label: const Text("Save Item"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}