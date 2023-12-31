class ProductModel {
  final String productId;
  final String productName;
  final String productUnit;
  final String productDetail;
  final String productImage;
  final double productPrice;
  final int review;
  final bool isExclusive;
  final bool isBestSelling;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productUnit,
    required this.productDetail,
    required this.productImage,
    required this.productPrice,
    required this.review,
    required this.isExclusive,
    required this.isBestSelling,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      productId: id,
      productName: json['productName'],
      productUnit: json['productUnit'],
      productDetail: json['productDetail'],
      productImage: json['productImage'],
      productPrice: json['productPrice'],
      review: json['review'],
      isExclusive: json['isExclusive'],
      isBestSelling: json['isBestSelling'],
    );
  }
}
