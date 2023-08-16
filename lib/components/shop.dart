import '../models/food.dart';

class Shop {
  //food menu
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
      name: "Salmon Sushi",
      price: "20.00",
      imagePath: "assets/images/salmon_sushi.png",
      rating: '4.9',
    ),

    // tuna
    Food(
      name: "Tuna",
      price: "23.00",
      imagePath: "assets/images/tuna.png",
      rating: '4.3',
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

// getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
}
