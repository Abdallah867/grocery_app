import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/helper/cache_helper.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:meta/meta.dart';

import '../../helper/service_locator.dart';
import '../../models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final databases = getIt.get<Databases>();
  final user = getIt.get<CacheHelper>().getUserId();
  int counter = 1;

  Future<List> fetchCart() async {
    try {
      emit(CartLoading());

      final databases = getIt.get<Databases>();
      final user = getIt.get<CacheHelper>().getUserId();

      // Fetch existing cart data
      var document = await databases.getDocument(
        databaseId: kDatabaseId,
        collectionId: kFavouriteCollectionId,
        documentId: user,
      );
      List<dynamic> existingCart = document.data['cart'].toList();
      return existingCart;
    } catch (e) {
      log(e.toString());
      throw e;
    }
  }

  Future<List<CartModel>> getProducts() async {
    try {
      List existingCart = await fetchCart();
      List<CartModel> products = [];
      for (var cartItem in existingCart) {
        final document = await databases.getDocument(
          databaseId: kDatabaseId,
          collectionId: kProductsCollectionId,
          documentId: cartItem['productId'],
        );
        CartModel product = CartModel.fromJson(
          cartItem,
          ProductModel.fromJson(document.data, document.$id),
        );
        print('$product');
        products.add(product);
      }
      emit(CartFetched(products: products));
      return products;
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> addToCart(String productId) async {
    try {
      final databases = getIt.get<Databases>();
      final user = getIt.get<CacheHelper>().getUserId();

      // Fetch existing cart
      List<dynamic> existingCart = await fetchCart();

      List cartProductIds = existingCart.map((e) => e['productId']).toList();

      // Update the array
      if (!cartProductIds.contains(productId)) {
        existingCart.add({
          'productId': productId,
          'numberOfProducts': 2,
        });

        // Update the document with the modified array
        await databases.updateDocument(
          databaseId: kDatabaseId,
          collectionId: kFavouriteCollectionId,
          documentId: user,
          data: {
            'cart': existingCart,
          },
        );
        emit(CartAdding());
      } else {
        emit(CartAddedBefore());
      }
    } catch (e) {
      emit(CartFailed(e: e.toString()));
      log(e.toString());
    }
  }

  Future<void> deleteFromCart(String productId) async {
    try {
      // Fetch existing cart
      List existingCart = await fetchCart();

      // Remove the item with the specified productId from the array

      existingCart.removeWhere((item) => item['productId'] == productId);
      print(existingCart.toString());

      // Update the document with the modified array
      await databases.updateDocument(
        databaseId: kDatabaseId,
        collectionId: kFavouriteCollectionId,
        documentId: user,
        data: {
          'cart': existingCart,
        },
      );
      List<CartModel> newCart = await getProducts();
      emit(CartDeleting(products: newCart));
    } catch (e) {
      emit(CartFailed(e: e.toString()));
      log(e.toString());
    }
  }
}
