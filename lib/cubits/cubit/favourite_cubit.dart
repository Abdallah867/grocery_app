import 'dart:convert';
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

  final String userId = getIt.get<CacheHelper>().getUserId();
  late List<String> favouriteItemsId;

  addItemtoFavouriteList(String userId, String itemId) async {
    try {
      favouriteItemsId = await getFavouriteList();
      favouriteItemsId.add(itemId);
      await databases.updateDocument(
          databaseId: kDatabaseId,
          collectionId: kFavouriteCollectionId,
          documentId: userId,
          data: {kFavouritesId: favouriteItemsId});
      await storeFavouriteInCache();
      emit(FavouriteAddingSuccess());
    } on Exception catch (e) {
      // TODO
      log(e.toString());
    }
  }

  deleteItemFromFavouriteList(String userId, String itemId) async {
    try {
      favouriteItemsId = await getFavouriteList();
      favouriteItemsId.remove(itemId);
      await databases.updateDocument(
          databaseId: kDatabaseId,
          collectionId: kFavouriteCollectionId,
          documentId: userId,
          data: {kFavouritesId: favouriteItemsId});
      await storeFavouriteInCache();
      emit(FavouriteDeletingSuccess());
    } on Exception catch (e) {
      // TODO
      log(e.toString());
    }
  }

  Future<List<String>> getFavouriteList() async {
    try {
      final document = await databases.getDocument(
        databaseId: kDatabaseId,
        collectionId: kFavouriteCollectionId,
        documentId: userId,
      );

      List<String> userFavourite = [];

      List<dynamic> documentList = document.data[kFavouritesId];
      for (var document in documentList) {
        userFavourite.add(document);
      }
      return Future.value(userFavourite);
    } on Exception catch (e) {
      log(e.toString());
      emit(
        FavouriteFailure(errMessage: e.toString()),
      );
      return Future.value([]);
    }
  }

  storeFavouriteInCache() async {
    List<String> gottenFavouriteList = await getFavouriteList();

    String favouriteListToString = jsonEncode(gottenFavouriteList);
    getIt.get<CacheHelper>().storeString(kFavouriteList, favouriteListToString);
    List favouriteList =
        jsonDecode(getIt.get<CacheHelper>().getString(kFavouriteList));
    print(favouriteList);
  }

  bool checkIfProductIsFavourite(String productId) {
    List favouriteList =
        jsonDecode(getIt.get<CacheHelper>().getString(kFavouriteList));
    bool isProductContained = favouriteList.contains(productId);
    return isProductContained;
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
