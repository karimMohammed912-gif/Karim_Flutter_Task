class ProductModel {
  final String title;
  final String imageUrl;
  final String price;
  final String originalPrice;
  final String salesCount;
  final bool isFavorite;
  ProductModel({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.salesCount,
    required this.isFavorite,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as String,
      originalPrice: map['originalPrice'] as String? ?? '',
      salesCount: map['salesCount'] as String,
      isFavorite: (map['isFavorite'] as int) == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'originalPrice': originalPrice,
      'salesCount': salesCount,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }
}

