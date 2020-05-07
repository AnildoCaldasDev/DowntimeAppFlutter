class ProductModel {
  String title;
  String category;

  ProductModel({this.title, this.category});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(title: json['title'], category: json['category']);
  }
}
