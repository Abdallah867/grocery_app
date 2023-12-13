import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_app/helper/service_locator.dart';

import '../../helper/cache_helper.dart';
import 'check_user_if_exists_state.dart';

class CheckUserIfExistsCubit extends Cubit<CheckUserIfExistsState> {
  CheckUserIfExistsCubit() : super(CheckUserIfExistsInitial());

  Future<User?> getUserIfExists() async {
    final account = getIt.get<Account>();

    try {
      final user = await account.get();
      getIt.get<CacheHelper>().saveUserId('userId', user.$id);

      emit(UserExists(user: user));
    } on AppwriteException catch (e) {
      if (e.code != 401 || e.type != 'general_unauthorized_scope')
        print(e.toString());
      emit(NoUserFound());
    }
    return null;
  }
}
