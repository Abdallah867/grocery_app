import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/models/product_model.dart';

import '../../helper/service_locator.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  Future<void> getProducts(String filter) async {
    final databases = getIt.get<Databases>();

    try {
      List<ProductModel> products = [];

      final documents = await databases.listDocuments(
          databaseId: kDatabaseId,
          collectionId: kProductsCollectionId,
          queries: [Query.equal(filter, true)]);

      for (var document in documents.documents) {
        print(document.data["indexes"]);
        print(document.$id);
        var product = ProductModel.fromJson(document.data, document.$id);
        products.add(product);
      }

      emit(ExclusiveProductSuccess(exclusiveProducts: products));
    } on AppwriteException catch (e) {
      emit(ProductFailure(errMessage: e.toString()));
    }
  }
}
