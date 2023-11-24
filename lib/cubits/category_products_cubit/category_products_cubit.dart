import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';

import '../../models/product_model.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());

  List<ProductModel> products = [];

  final client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("651de5a0d4c1158c8b2f");

  Future<void> getCategoryProducts(String category) async {
    print(category);
    final databases = Databases(client);

    try {
      final documents = await databases.listDocuments(
          databaseId: '6521defc672616c7689e',
          collectionId: '6522f8ee91a25078b124',
          queries: [Query.equal("catergory", category)]);

      for (var document in documents.documents) {
        var product = ProductModel.fromJson(document.data, document.$id);
        products.add(product);
        print("XD");
      }
      emit(CategoryProductsSuccess(categoryProduct: products));
    } on AppwriteException catch (e) {
      print(e);
      emit(CategoryProductsFailure());
    }
  }
}
