import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../widget/product_card.dart';

class HomePage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  final List<Product> products = [
    Product(
      id: 1,
      name: 'Shirt',
      price: 20,
      imageUrl: 'https://i.imgur.com/QCNbOAo.png', // 👕 Free shirt image
    ),
    Product(
      id: 2,
      name: 'Shoes',
      price: 40,
      imageUrl: 'https://i.imgur.com/shoes,jpg',
    ),
    Product(
      id: 3,
      name: 'Hat',
      price: 15,
      imageUrl: 'https://i.imgur.com/ULHbPTc.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onAdd: () => cartController.addToCart(product),
          );
        },
      ),
    );
  }
}
