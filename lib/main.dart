import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/components/shop.dart';
import 'package:resturant_app/pages/cart_page.dart';
import 'package:resturant_app/pages/food_details.dart';
import 'package:resturant_app/pages/intro_page.dart';
import 'package:resturant_app/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => CartPage(),
      },
    );
  }
}
