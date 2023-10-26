import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());
  List<CategoryModel> categoriesList = [];
  getCategories() {
    Client client = Client();
    Databases databases = Databases(client);

    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('651de5a0d4c1158c8b2f');
    Future categories = databases.listDocuments(
      databaseId: '6521defc672616c7689e',
      collectionId: '653299cd6b33fca84094',
    );

    categories.then((response) {
      for (var document in response.documents) {
        print(document);

        var category = CategoryModel.fromJson(document.data);
        categoriesList.add(category);
      }
      emit(CategorySuccess());
    }).catchError((error) {
      print(error.response);
      emit(CategoryFailure(errMessage: error.toString()));
    });
  }
}
