class ProdutoModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List images;

  ProdutoModel(
      {required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'],
      description: map['description'],
      price: map['price'] * 1.0,
      rating: map['rating'],
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List.from((map['images'])),
    );
  }
  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      thumbnail: json['thumbnail'] ?? '',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'no description',
      price: (json['price'] ?? 0).toDouble(),
      brand: json['brand'] ?? 'no brand',
      images: [],
      category: json['category'] ?? 'no category',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}
