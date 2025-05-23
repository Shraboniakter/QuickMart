class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl; // ✅ image url added

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
