class Product {
  final String? id;
  final String name;
  final int price;
  final String imageUrl;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  Product copyWith({
    String? id,
    String? name,
    int? price,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
