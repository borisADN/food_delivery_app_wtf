import 'package:application/constants.dart';
import 'package:application/models/product_model.dart';
import 'package:application/screens/food_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductsItemsDisplay extends StatefulWidget {
  final FoodModel food;
  const ProductsItemsDisplay({super.key, required this.food});

  @override
  State<ProductsItemsDisplay> createState() => _ProductsItemsDisplayState();
}

class _ProductsItemsDisplayState extends State<ProductsItemsDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) {
              return FoodDetailScreen(food: widget.food);
            },
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 35,
            child: Container(
              height: 180,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    spreadRadius: 10,
                    blurRadius: 20,
                    // color: Colors.grey.withOpacity(0.5),
                    // spreadRadius: 5,
                    // blurRadius: 7,
                    // offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red[100],
                child: Image.asset("assets/images/icon/fire.png"),
              ),
            ),
          ),

          Container(
            width: size.width * 0.5,
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.food.imageCard,
                  child: Image.asset(
                    widget.food.imageCard,
                    height: 100,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.food.specialItems,
                  style: const TextStyle(
                    height: 0.1,
                    letterSpacing: 0.5,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      // fontSize: 20,
                      fontFamily: "Baloo",
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.food.price.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' F',
                        style: TextStyle(
                          fontSize: 15,
                          color: red,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   widget.food.price.toString(),
                //   style: const TextStyle(
                //     fontSize: 25,
                //     color: Colors.black,
                //     // fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
