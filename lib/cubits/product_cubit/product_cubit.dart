import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());
  final client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("651de5a0d4c1158c8b2f");

  Future<void> getProducts(String filter) async {
    final databases = Databases(client);

    try {
      List<ProductModel> products = [];

      final documents = await databases.listDocuments(
          databaseId: '6521defc672616c7689e',
          collectionId: '6522f8ee91a25078b124',
          queries: [Query.equal(filter, true)]);

      for (var document in documents.documents) {
        var product = ProductModel.fromJson(document.data, document.$id);
        products.add(product);
      }
      print(1);

      emit(ExclusiveProductSuccess(exclusiveProducts: products));
    } on AppwriteException catch (e) {
      print(e);
      // emit(ProductFailure(errMessage: e.toString()));
    }
  }
}
