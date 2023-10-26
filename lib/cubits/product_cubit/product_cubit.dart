import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());
  List<ProductModel> exclusiveOfferList = [];
  List<ProductModel> bestSellingList = [];

  final client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("651de5a0d4c1158c8b2f");

  Future<List<ProductModel>>? getProducts() async {
    final databases = Databases(client);

    try {
      List<ProductModel> products = [];

      final documents = await databases.listDocuments(
          databaseId: '6521defc672616c7689e',
          collectionId: '6522f8ee91a25078b124',
          queries: [Query.equal("isExclusive", true)]);

      for (var document in documents.documents) {
        var product = ProductModel.fromJson(document.data);
        products.add(product);

        // if (document.data['isExclusive']) {
        // }
        // if (document.data['isBestSelling']) {
        //   products.add(product);
        // }
      }
      emit(ProductSuccess());

      return products;
    } on AppwriteException catch (e) {
      print(e);
      emit(ProductFailure(errMessage: e.toString()));
    }
  }
}
