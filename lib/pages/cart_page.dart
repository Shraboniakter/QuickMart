import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/product.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Obx(() {
        final items = cartController.cartItems;

        if (items.isEmpty) {
          return Center(child: Text("Your cart is empty"));
        }

        return Column(
          children: [
            Expanded(
              child: ListView(
                children:
                    items.entries.map((entry) {
                      final Product product = entry.key;
                      final int quantity = entry.value;

                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text("Qty: $quantity x \$${product.price}"),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed:
                              () => cartController.removeFromCart(product),
                        ),
                      );
                    }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Total: \$${cartController.totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }),
    );
  }
}
