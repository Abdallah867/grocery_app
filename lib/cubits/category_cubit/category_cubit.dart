import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../helper/service_locator.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());
  List<CategoryModel> categoriesList = [];
  getCategories() {
    final databases = getIt.get<Databases>();

    Future categories = databases.listDocuments(
      databaseId: kDatabaseId,
      collectionId: kCategoryCollectionId,
    );

    categories.then((response) {
      for (var document in response.documents) {
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
