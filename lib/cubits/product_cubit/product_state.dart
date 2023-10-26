part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {}

final class ProductFailure extends ProductState {
  final String errMessage;

  ProductFailure({required this.errMessage});
}
