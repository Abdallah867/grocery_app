class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteAddingSuccess extends FavouriteState {
  // final List<ProductModel> exclusiveProducts;

  // ExclusiveProductSuccess({required this.exclusiveProducts});
}

final class FavouriteDeletingSuccess extends FavouriteState {
  // final List<ProductModel> exclusiveProducts;

  // ExclusiveProductSuccess({required this.exclusiveProducts});
}

final class FavouriteFailure extends FavouriteState {
  final String errMessage;

  FavouriteFailure({required this.errMessage});
}
