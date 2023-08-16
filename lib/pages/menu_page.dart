import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturant_app/components/buttons.dart';
import 'package:resturant_app/models/food.dart';
import 'package:resturant_app/pages/food_details.dart';
import 'package:resturant_app/themes/colors.dart';
import '../components/food_tile.dart';

class MenuPage extends StatefulWidget {
  MenuPage({
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  List foodMenu = [
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

  //Navigate item details page with index
  void navigateToFoodDetails(int index, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetails(
                  food: foodMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "Dhaka",
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 22% Off',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),
                //redeem button
                Image.asset(
                  'assets/images/many_sushi.png',
                  height: 100,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // search list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: "Search here..",
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () {
                  navigateToFoodDetails(index, context);
                },
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 25,
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'assets/images/salmon_eggs.png',
                      height: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          'Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //price
                        const Text(
                          "\$21.00",
                        ),
                      ],
                    )
                  ],
                ),
                // heart
                Icon(
                  Icons.favorite_outline,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
