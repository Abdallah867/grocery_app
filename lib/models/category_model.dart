class CategoryModel {
  final String categoryName;
  final String imageUrl;

  CategoryModel({required this.categoryName, required this.imageUrl});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json["CategoryName"],
      imageUrl: json['CategoryImage'],
    );
  }
}
