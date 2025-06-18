import 'package:application/constants.dart';
import 'package:application/models/categories_model.dart';
import 'package:application/models/product_model.dart';
import 'package:application/screens/view_all_screen.dart';
import 'package:application/widgets/products_items_display.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = myCategories[0].name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          SizedBox(width: 25),
          Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: grey1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/icon/dash.png'),
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: red),

              SizedBox(width: 5),
              Text(
                'Abidjan, Côte d\'Ivoire',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: orange),
            ],
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/my_profile.jpeg',
              height: 45,
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBanner(),
                SizedBox(height: 25),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _buildCategoryList(),
          SizedBox(height: 30),
          viewAll(),
          SizedBox(height: 30),
          _buildProductSection(),
        ],
      ),
    );
  }

  Widget _buildProductSection() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ourFoods.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 25,
              right: index == ourFoods.length - 1 ? 25 : 0,
            ),
            child: ProductsItemsDisplay(food: ourFoods[index]),
          );
        },
      ),
    );
  }

  Padding viewAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Populaires',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ViewAllProductScreen()),
              );
            },
            child: Row(
              children: [
                Text(
                  'Voir tout',
                  style: TextStyle(fontSize: 18, color: orange),
                ),
                SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: myCategories.length,
        itemBuilder: (context, index) {
          final category = myCategories[index];
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 15 : 0, right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category.name;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: selectedCategory == category.name ? red : grey1,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color:
                            selectedCategory == category.name
                                ? Colors.white
                                : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(category.image, height: 20, width: 20),
                    ),
                    SizedBox(width: 15),
                    Text(
                      category.name,
                      style: TextStyle(
                        color:
                            selectedCategory == category.name
                                ? Colors.white
                                : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container appBanner() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: imageBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Baloo",
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Livraison Rapide ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'de vos plats',
                        style: TextStyle(color: red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                  child: Text(
                    'Essayer',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/images/courier.png"),
        ],
      ),
    );
  }
}
