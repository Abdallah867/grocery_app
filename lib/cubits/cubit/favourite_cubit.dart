import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/helper/service_locator.dart';

import '../../constants.dart';
import '../../helper/cache_helper.dart';
import '../../models/product_model.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  Databases databases = getIt.get<Databases>();

  final String userId = getIt.get<CacheHelper>().getUserId(kuserId);
  late List<String> favouriteItemsId;

  addItemtoFavouriteList(String userId, String itemId) async {
    try {
      favouriteItemsId = await getFavouriteList() ?? [];
      favouriteItemsId.add(itemId);
      await databases.updateDocument(
          databaseId: kDatabaseId,
          collectionId: kCategoryCollectionId,
          documentId: userId,
          data: {kFavouritesId: favouriteItemsId});
    } on Exception catch (e) {
      // TODO
      log(e.toString());
    }
  }

  Future<List<String>?> getFavouriteList() async {
    try {
      final userFavourites = await databases.getDocument(
        databaseId: kDatabaseId,
        collectionId: kFavouriteCollectionId,
        documentId: userId,
      );

      return userFavourites.data[kFavouritesId];
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  getFavouriteProducts(List<String> favouriteProductsId) async {
    final documents = await databases.listDocuments(
        databaseId: kDatabaseId,
        collectionId: kProductsCollectionId,
        queries: [Query.equal("\$id", favouriteProductsId)]);

    final List<ProductModel> products = documents.documents
        .map((document) => ProductModel.fromJson(document.data, document.$id))
        .toList();

    return products;
  }
}
