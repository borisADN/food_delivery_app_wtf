class FoodModel {
  String imageCard, imageDetail, name;
  double  rate;
  int price;
  String specialItems;
  String category;
  FoodModel({
    required this.imageCard,
    required this.imageDetail,
    required this.name,
    required this.price,
    required this.rate,
    required this.specialItems,
    required this.category,
  });
}

List<FoodModel> ourFoods = [
  FoodModel(
    imageCard: 'assets/images/product/beef_burger.png',
    imageDetail: 'assets/images/product/beef_burger1.png',
    name: 'Beef Burger',
    price: 8500,
    rate: 4.5,
    specialItems: 'Cheesy Mozarella 🧀',
    category: 'Burger',
  ),
  FoodModel(
    imageCard: 'assets/images/product/double_burger.png',
    imageDetail: 'assets/images/product/double_burger1.png',
    name: 'Double Burger',
    price: 5400,
    rate: 4.9,
    specialItems: 'Double Beef 🍖',
    category: 'Burger',
  ),
  FoodModel(
    imageCard: 'assets/images/product/cheese-burger.png',
    imageDetail: 'assets/images/product/cheese-burger1.png',
    name: 'Cheese Burger',
    price: 9200,
    rate: 4.8,
    specialItems: 'Extra Cheese 🧀',
    category: 'Burger',
  ),
  FoodModel(
    imageCard: 'assets/images/product/bacon_burger.png',
    imageDetail: 'assets/images/product/bacon_burger1.png',
    name: 'Bacon Burger',
    price: 6500,
    rate: 5.0,
    specialItems: 'Mix Beef 🥩',
    category: 'Burger',
  ),
  FoodModel(
    imageCard: 'assets/images/product/pizza11.png',
    imageDetail: 'assets/images/product/pizza.png',
    name: 'Chicken Pizza',
    price: 1200,
    rate: 4.0,
    specialItems: 'Cheese Pizza 🍕',
    category: 'Pizza',
  ),
  FoodModel(
    imageCard: 'assets/images/product/cup_cake.png',
    imageDetail: 'assets/images/product/cup-cake1.png',
    name: 'Cream Cake',
    price: 1000,
    rate: 4.7,
    specialItems: 'Mix Cream 🧁',
    category: 'Cup Cake',
  ),
];

var desc =
    "This is a special types of tiems, often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a 'specialItems sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns.";

