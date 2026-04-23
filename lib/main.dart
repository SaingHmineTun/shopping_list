import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shopping_list/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  print("Initialized Hive");
  await Hive.openBox("shopping_list");
  print("Box is open");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(fontFamily: "AJ09"),
    );
  }
}
