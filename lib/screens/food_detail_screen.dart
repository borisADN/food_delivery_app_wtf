import 'package:application/constants.dart';
import 'package:application/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodModel food;
  const FoodDetailScreen({super.key, required this.food});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        forceMaterialTransparency: true,
        actions: [
          SizedBox(width: 27),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.more_horiz_rounded,
              size: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 27),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: imageBackground,
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/images/food_pattern.png',
              repeat: ImageRepeat.repeatY,
              color: imageBackground2,
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Colors.white,
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 90),
                  Center(
                    child: Hero(
                      tag: widget.food.imageCard,
                      child: Image.asset(
                        widget.food.imageDetail,
                        height: 320,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // SizedBox(width: 15),
                            GestureDetector(
                              onTap:
                                  () => setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  }),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            SizedBox(width: 15),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap:
                                  () => setState(() {
                                    quantity++;
                                  }),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                            // SizedBox(width: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.food.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.food.specialItems,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: "Baloo",
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.food.price.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
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
                    ],
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodInfo(
                        'assets/images/icon/star.png',
                        widget.food.rate.toString(),
                      ),
                      foodInfo(
                        'assets/images/icon/fire.png',
                        '${widget.food.rate} kcal',
                      ),
                      foodInfo(
                        'assets/images/icon/time.png',
                        '${widget.food.rate} min',
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  ReadMoreText(
                    desc,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      height: 1.5,
                      fontSize: 16,
                    ),
                    numLines: 2,
                    readMoreText: 'Lire Plus',
                    readLessText: 'Lire Moins',
                    readMoreTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: red,
                    ),
                    readLessIcon: Icon(Icons.keyboard_arrow_up, color: red),
                    readMoreIcon: Icon(Icons.keyboard_arrow_down, color: red),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: red,
        label: MaterialButton(
          onPressed: () {},
          child: Text(
            'Ajouter au panier',
            style: TextStyle(color: Colors.white),
          ),
        ),
        icon: Icon(Icons.add_shopping_cart, color: Colors.white),
      ),
    );
  }
}

Row foodInfo(image, value) {
  return Row(
    children: [
      Image.asset(image, width: 25),
      SizedBox(width: 10),
      Text(
        value,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    ],
  );
}
