class ProductModel_stefano { 
  final String productId_stefano;
  final String name_stefano;
  final num price_stefano; 
  final int stock_stefano;
  final String imageUrl_stefano;

  ProductModel_stefano({
    required this.productId_stefano,
    required this.name_stefano,
    required this.price_stefano,
    required this.stock_stefano,
    required this.imageUrl_stefano,
  });

  factory ProductModel_stefano.fromJson(Map<String, dynamic> json) {
    return ProductModel_stefano(
      productId_stefano: json['product_id'] ?? '',
      name_stefano: json['name'] ?? '',
      price_stefano: json['price'] ?? 0,
      stock_stefano: json['stock'] ?? 0,
      imageUrl_stefano: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId_stefano,
      'name': name_stefano,
      'price': price_stefano,
      'stock': stock_stefano,
      'image_url': imageUrl_stefano,
    };
  }
}