import 'package:application/models/product_model.dart';
import 'package:application/widgets/products_items_display.dart';
import 'package:flutter/material.dart';

class ViewAllProductScreen extends StatefulWidget {
  const ViewAllProductScreen({super.key});

  @override
  State<ViewAllProductScreen> createState() => _ViewAllProductScreenState();
}

class _ViewAllProductScreenState extends State<ViewAllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          'Tout Nos Produits',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        forceMaterialTransparency: true,
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(8),
        itemCount: ourFoods.length,
        itemBuilder: (_, index) {
          return ProductsItemsDisplay(food: ourFoods[index]);
        },
      ),
    );
  }
}
