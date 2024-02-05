part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartAdding extends CartState {}

final class CartStored extends CartState {}

final class CartAddedBefore extends CartState {}

final class IsProductExists extends CartState {
  final bool isExists;

  IsProductExists({required this.isExists});
}

final class CartFetched extends CartState {
  final List<CartModel> products;

  CartFetched({required this.products});
}

final class CartDeleting extends CartState {
  final List<CartModel> products;

  CartDeleting({required this.products});
}

final class CartFailed extends CartState {
  final String e;
  CartFailed({required this.e});
}
