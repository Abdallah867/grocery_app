part of 'category_products_cubit.dart';

class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoading extends CategoryProductsState {}

final class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductModel> categoryProduct;

  CategoryProductsSuccess({required this.categoryProduct});
}

final class CategoryProductsFailure extends CategoryProductsState {}
