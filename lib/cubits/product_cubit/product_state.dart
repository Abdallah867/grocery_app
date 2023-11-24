part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ExclusiveProductSuccess extends ProductState {
  final List<ProductModel> exclusiveProducts;

  ExclusiveProductSuccess({required this.exclusiveProducts});
}

final class ProductFailure extends ProductState {
  final String errMessage;

  ProductFailure({required this.errMessage});
}
