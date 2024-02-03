import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';

import '../../constants.dart';
import '../../helper/service_locator.dart';
import '../../models/product_model.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());

  List<ProductModel> products = [];

  Future<void> getCategoryProducts(String category) async {
    final databases = getIt.get<Databases>();

    try {
      emit(CategoryProductsLoading());
      final documents = await databases.listDocuments(
          databaseId: kDatabaseId,
          collectionId: kProductsCollectionId,
          queries: [Query.equal("catergory", category)]);

      for (var document in documents.documents) {
        var product = ProductModel.fromJson(document.data, document.$id);
        products.add(product);
      }
      emit(CategoryProductsSuccess(categoryProduct: products));
    } on AppwriteException catch (e) {
      print(e);
      emit(CategoryProductsFailure());
    }
  }
}
